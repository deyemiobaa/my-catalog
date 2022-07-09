require_relative '../modules/pull_data'
require_relative './music_controller'
require_relative './book_controller'
require_relative './game_controller'
require_relative './movie_controller'

class UI
  def initialize
    @books = BookController.new
    @music_albums = MusicAlbumController.new
    @movies = MovieController.new
    @games = GameController.new
  end

  def show_menu
    puts "\nPlease choose an option by entering a number:"
    puts '1. Books'
    puts '2. Music'
    puts '3. Movies'
    puts '4. Games'
    puts "5. Exit\n\n"
    gets.chomp
  end

  def run
    user_choice = show_menu

    choices = {
      '1' => -> { @books.books_sublist },
      '2' => -> { @music_albums.music_sublist },
      '3' => -> { @movies.movies_sublist },
      '4' => -> { @games.games_sublist },
      '5' => -> { exit_app }
    }

    if choices.key?(user_choice)
      choices[user_choice].call
    else
      puts 'Invalid input, please enter a valid choice.'
      choices.default = run
    end
  end

  def exit_app
    puts 'Thank You for using this app... See you again!'
    exit
  end
end

# app = UI.new
# app.run
