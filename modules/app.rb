class App
  attr_accessor :books, :labels, :musics

  def initialize
    @books = []
    @labels = []
    @musics = []
    @games = []
    @author = []
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

  def add_game(game)
    @games << game unless @games.include?(game)
  end

  def add_author
    @authors << author unless @authors.include?(author)
  end
end
