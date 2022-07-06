require_relative '../modules/date_handler'
require_relative '../modules/validate_state'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative './app'
require_relative '../classes/game'
require_relative '../classes/author'

module CreatingHandler
  include DateHandler
  include ValidateState

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
    puts 'Add a genre to the book'
    genre = create_genre
    puts 'Add an author to the book'
    author = create_author

    book.add_label(label)
    book.add_genre(genre)
    book.add_author(author)
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
    puts 'Label added successfully!'
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
    puts 'Add a label to the game'
    label = create_label
    puts 'Add a genre to the game'
    genre = create_genre
    puts 'Add an author to the game'
    author = create_author

    game.add_label(label)
    game.add_genre(genre)
    game.add_author(author)
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
    p 'Author added successfully'
    author
  end

  def self.create_genre
    puts 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @app.add_genre(genre)
    puts 'Genre added successfully!'
    genre
  end

  def self.create_music
    puts 'Let\'s create the music!'
    print 'When was your music published (YYYY-MM-DD)? '
    date = gets.chomp
    date_of_music_publish = DateHandler.from_string(date)
    print 'Is your music on spotify? (yes/no) '
    is_on_spotify = gets.chomp
    spotify_state = ValidateState.check_spotify_state(is_on_spotify)
    print 'What is the music Genre?: '
    music_genre = gets.chomp
    genre = Genre.new(music_genre)
    print 'Who is the music author first name? '
    music_author_fname = gets.chomp
    print 'Who is the music author second name? '
    music_author_secname = gets.chomp
    author = Author.new(music_author_fname, music_author_secname)
    music = MusicAlbum.new(spotify_state, date_of_music_publish)
    music.add_genre(genre)
    music.add_author(author)
    @app.add_music(music)
    puts 'Your music was added succesfully!'
  end
end

CreatingHandler.create_game
