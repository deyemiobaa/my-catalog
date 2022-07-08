require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../modules/date_handler'
require_relative '../modules/validate_state'
require_relative './app'

def create_game
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
  @app.games << game
  @app.games.each_with_index do |game, index|
    puts "#{index}) Multiplayer: #{game.multiplayer}, Last played date: #{game.last_played_at},\
  Publish date: #{game.publish_date}"
  end
  p 'Game created successfully'
end

module CreatingHandler
  include DateHandler
  include ValidateState

  def self.create_book
    puts 'Enter book publisher:'
    publisher = gets.chomp
    puts 'Enter book cover state (good/bad):'
    cover_state = gets.chomp
    puts 'Enter book publish date:(yyyy-mm-dd)'
    publish_date = gets.chomp
    until DateHandler.validate_date(publish_date)
      puts 'Invalid date format. Try again: (yyyy-mm-dd)'
      publish_date = gets.chomp
    end
    book = Book.new(publisher, cover_state, publish_date)
    add_label_author_genre_to_item(book)
    @app.add_book(book)
    puts 'Book created successfully!'
  end

  def self.create_label
    puts 'Add a new label for your item'
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title, color)
    @app.add_label(label)
    puts 'Label added successfully!'
    label
  end

 

  def self.create_author
    puts 'Add a new author for your item'
    puts 'Enter first name:'
    first_name = gets.chomp
    puts 'Enter last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @app.add_author(author)
    p 'Author added successfully'
    author
  end

  def self.create_genre
    puts 'Add a new genre for your item'
    puts 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @app.add_genre(genre)
    p 'Genre added successfully!'
    genre
  end

  def self.create_music
    puts 'Let\'s create the music!'
    puts 'When was your music published (YYYY-MM-DD)? '
    date = gets.chomp
    date_of_music_publish = DateHandler.from_string(date)
    puts 'Is your music on spotify? (yes/no) '
    is_on_spotify = gets.chomp
    spotify_state = ValidateState.check_spotify_state(is_on_spotify)
    music = MusicAlbum.new(spotify_state, date_of_music_publish)
    add_label_author_genre_to_item(music)
    @app.add_music(music)
    p 'Your music was added succesfully!'
  end

  def self.add_label_author_genre_to_item(item)
    label = create_label
    author = create_author
    genre = create_genre
    item.add_label(label)
    item.add_author(author)
    item.add_genre(genre)
  end

  def self.create_items(number)
    case number
    when 1
      create_game
    when 2
      create_author
    end
  end
end
