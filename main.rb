require_relative './modules/app'
require_relative './modules/storage_handler'
require_relative './modules/listing_handler'
require_relative './modules/creating_handler'

class Main
  include StorageData
  include ListingHandler
  include CreatingHandler
  print "Welcome to My Catalog \n\n"
  def initialize
    @app = App.new
  end

  def handle_ui
    loop do
      @app.entry
      option = gets.chomp.to_i
      print "\n"
      run(option)
    end
  end

  def run(option)
    case option
    when 1
      create_game
    when 3
      list_games
    when 5
      puts 'Goodbye!!'
      StorageData.save_data(@app.games, @app.authors)
      exit
    else
      puts 'Invalid selection, please input a valid number'
      handle_ui
    end
  end
end

Main.new.handle_ui
