require 'json'
require_relative '../modules/data_handler'

module PushJSONData
  def self.commit_albums(music_album_items)
    music_album = []
    music_album_items.each do |music|
      music_album.push({
                         publish_date: music.publish_date,
                         on_spotify: music.on_spotify,
                         genre: music.genre.name,
                         author: music.author.name
                       })
    end
    DataHandler.save_data('music_albums', music_album)
  end

  def self.commit_books(book_items)
    books = []
    book_items.each do |game|
      books.push({
                   publish_date: game.publish_date,
                   author: game.author.name,
                   publisher: game.publisher,
                   cover_state: game.cover_state,
                   color: game.label.color,
                   label: game.label.title
                 })
    end
    DataHandler.save_data('books', books)
  end

  def self.commit_games(game_items)
    games = []
    game_items.each do |game|
      games.push({
                   publish_date: game.publish_date,
                   author: game.author.name,
                   multiplayer: game.multiplayer,
                   last_played_at: game.last_played_at
                 })
    end
    DataHandler.save_data('games', games)
  end

  def self.commit_movies(movie_items)
    movies = []
    movie_items.each do |movie|
      movies.push({
                    movie_name: movie.name,
                    movie_genre: movie.genre.name,
                    silent: movie.silent,
                    publish_date: movie.publish_date,
                    movie_source: movie.source.name
                  })
    end
    DataHandler.save_data('movies', movies)
  end
end
