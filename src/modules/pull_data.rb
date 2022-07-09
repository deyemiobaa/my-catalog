require_relative './data_handler'
require_relative '../classes/music_album'
require_relative '../classes/book'
require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/game'
require_relative '../classes/movie'
require_relative '../classes/source'

module PullJSONData
  def self.fetch_music_albums
    music_albums = []
    DataHandler.read_data('music_albums').each do |music|
      new_music_album = MusicAlbum.new(music['publish_date'], music['on_spotify'])
      new_genre = Genre.new(music['genre'])
      new_author = Author.new(music['author'])
      new_music_album.add_genre = new_genre
      new_music_album.add_author = new_author
      music_albums.push(new_music_album)
    end
    music_albums
  end

  def self.fetch_books
    books = []
    DataHandler.read_data('books').each do |game|
      new_book = Book.new(game['publisher'], game['cover_state'], game['publish_date'])
      new_label = Label.new(game['label'], game['color'])
      new_author = Author.new(game['author'])
      new_book.add_label = new_label
      new_book.add_author = new_author
      books.push(new_book)
    end
    books
  end

  def self.fetch_games
    books = []
    DataHandler.read_data('games').each do |game|
      new_book = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
      new_author = Author.new(game['author'])
      new_book.add_author = new_author
      books.push(new_book)
    end
    books
  end

  def self.fetch_movies
    movies = []
    DataHandler.read_data('movies').each do |movie|
      new_movie = Movie.new(movie['movie_name'], movie['silent'], movie['publish_date'])
      new_genre = Genre.new(movie['movie_genre'])
      new_source = Source.new(movie['movie_source'])
      new_movie.add_source = new_source
      new_movie.add_genre = new_genre
      movies.push(new_movie)
    end
    movies
  end
end
