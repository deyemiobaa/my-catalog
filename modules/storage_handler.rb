require 'json'

module StorageData
  def self.create_file
    filename = %w[./data/games.json ./data/authors.json ./data/books.json
                  ./data/labels.json ./data/genres.json ./data/musics.json]
    filename.each { |file| File.new(file, 'w+') unless File.exist?(file) }
  end

  def self.save_data(games, authors)
    save_games(games)
    save_authors(authors)
  end

  def self.save_books(app)
    books_data = app.books.map do |book|
      {
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date,
        label: book.label.to_json,
        genre: book.genre.to_json,
        author: book.author.to_json
      }
    end
    json_data = JSON.generate(books_data)
    File.write('./data/books.json', json_data)
  end

  def self.save_labels(app)
    labels_data = app.labels.map do |label|
      {
        title: label.title,
        color: label.color
      }
    end
    json_data = JSON.generate(labels_data)
    File.write('./data/labels.json', json_data)
  end

  def self.save_games(games)
    saved_games = []
    games.each do |game|
      saved_games.push({
                         multiplayer: game.multiplayer,
                         publish_date: game.publish_date,
                         last_played_at: game.last_played_at
                       })
    end
    File.write('./data/games.json', JSON.generate(saved_games))
  end

  def self.save_authors(authors)
    saved_authors = []
    authors.each do |author|
      saved_authors.push({
                           first_name: author.first_name,
                           last_name: author.last_name
                         })
    end
    File.write('./data/authors.json', JSON.generate(saved_authors))
  end

  def self.save_musics(musics)
    mq = []
    musics.each do |music|
      mq.push({
                on_spotify: music.on_spotify,
                publish_date: music.publish_date,
                genre: music.genre.name,
                music_author_fname: music.author.first_name,
                music_author_secname: music.author.last_name
              })
    end
    File.write('./data/musics.json', JSON.generate(mq).to_s)
  end

  def self.save_genres(genres)
    gen = []
    genres.each do |genre|
      gen.push({
                 name: genre.name
               })
    end
    File.write('./data/genres.json', JSON.generate(gen).to_s)
  end
end
