class App
  attr_reader :books, :labels
  def initialize
    @books = []
    @labels = []
  end

  def add_book(book)
    @books << book unless @books.include?(book)
  end

  def add_label(label)
    @labels << label unless @labels.include?(label)
  end
end