require 'json'
require_relative '../classes/label'

module LoadDataHandler
  def self.load_data(app)
    load_labels(app)
    load_books(app)
  end

  def self.load_labels(app)
    return unless File.exist?('./data/labels.json')
    return if File.empty?('./data/labels.json')

    file = File.read('./data/labels.json')
    file_data = JSON.parse(file)
    file_data.each do |data|
      label = Label.new(data['title'], data['color'])
      app.add_label(label)
    end
  end

  def self.load_books(app)
    return unless File.exist?('./data/books.json')
    return if File.empty?('./data/books.json')

    file = File.read('./data/books.json')
    file_data = JSON.parse(file)
    file_data.each do |data|
      book = Book.new(data['publisher'], data['cover_state'], data['publish_date'])
      book.label = Label.from_json(data['label'])
      book.genre = Genre.from_json(data['genre'])
      book.author = Author.from_json(data['author'])
      app.add_book(book)
    end
  end
end
