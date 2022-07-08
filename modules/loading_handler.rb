require 'json'
require_relative '../classes/label'
require_relative '../classes/game'

module LoadDataHandler
  def self.load_data(app)
    load_labels(app)
    load_books(app)
    load_authors(app)
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

  def load_games
    games = []
    if File.exist?('./data/games.json')
      if File.empty?('./data/games.json')
        File.write('./data/games.json', [])
      else
        loaded_games = JSON.parse(File.read('./data/games.json'))
        loaded_games.each do |game|
          games << Game.new(game['multiplayer'], game['publish_date'], game['last_played_at'])
        end
      end
    else
      File.write('./data/games.json', [])
    end
    games
  end

  def load_authors
    authors = []
    if File.exist?('./data/authors.json')
      if File.empty?('./data/authors.json')
        File.write('./data/authors.json', [])
      else
        loaded_authors = JSON.parse(File.read('./data/authors.json'))
        loaded_authors.each do |_game|
          authors << Author.new(author['first_name'], author['last_name'])
        end
      end
    else
      File.write('./data/authors.json', [])
    end
    authors
  end
end
