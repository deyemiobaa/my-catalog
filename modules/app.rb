require_relative './loading_handler'

class App
  attr_accessor :books, :labels, :musics, :games, :authors

  include LoadDataHandler

  def initialize
    @books = []
    @labels = []
    @musics = []
    @genres = []
    @games = load_games
    @authors = load_authors
  end

  def entry
    puts "\nPlease select an option by entering a number"
    puts "\n\n"
    puts "1 - Create a game
    \r2 - Create an author
    \r3 - List all games
    \r4 - List all authors
    \r5 - Exit"
    puts "\n"
  end

  def add_book(book)
    @books << book unless @books.include?(book)
  end

  def add_label(label)
    @labels << label unless @labels.include?(label)
  end

  def add_music(music)
    @musics << music unless @musics.include?(music)
  end

  def add_genre(genre)
    @genres << genre unless @genres.include?(genre)
  end

  def add_game(game)
    @games << game unless @games.include?(game)
  end

  def add_author(author)
    @authors << author unless @authors.include?(author)
  end
end
