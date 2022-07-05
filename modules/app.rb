class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
    @musics = []
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
end
