require_relative '../modules/date_handler'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative './app'
require_relative '../classes/game'
require_relative '../classes/author'

module CreatingHandler
  include DateHandler

  @app = App.new
  def self.create_book
    puts 'Enter book publisher:'
    publisher = gets.chomp
    puts 'Enter book cover state:'
    cover_state = gets.chomp
    puts 'Enter book publish date:(yyyy-mm-dd)'
    publish_date = gets.chomp
    until DateHandler.validate_date(publish_date)
      puts 'Invalid date format. Try again:'
      publish_date = gets.chomp
    end
    book = Book.new(publisher, cover_state, publish_date)

    puts 'Add a label to the book'
    label = create_label
    book.add_label(label)
    @app.add_book(book)
    puts 'Book created successfully!'
  end

  def self.create_label
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title, color)
    @app.add_label(label)
    label
  end

  def self.create_game
    puts 'Enter game multiplayer'
    multiplayer = gets.chomp.to_s

    puts 'Enter the date the game was last played: YYYY-MM-DD'
    last_played_at = gets.chomp
    until DateHandler.validate_date(last_played_at)
      puts 'Invalid date format. Try again: YYYY-MM-DD'
      last_played_at = gets.chomp
    end

    puts 'Enter the publish date of the game: YYYY-MM-DD'
    publish_date = gets.chomp
    until DateHandler.validate_date(publish_date)
      puts 'Invalid date format. Try again: YYYY-MM-DD'
      publish_date = gets.chomp
    end
    game = Game.new(multiplayer, last_played_at, publish_date)
    @app.add_game(game)
    p 'Game created successfully'
  end

  def self.create_author
    puts 'Enter first name:'
    first_name = gets.chomp
    puts 'Enter last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @app.add_author(author)
    p 'Author created successfully'
  end
end

CreatingHandler.create_game
