module StorageData
  #   def save_games(games)
  #     saved_games = []
  #     games.each do |game|
  #       saved_games.push({
  #         multiplayer: game.multiplayer
  #         publish_date: game.publish_date
  #         last_played_at: game.last_played_at
  #       })
  #     end
  #     File.write('./data/books.json', JSON.generate(saved_games))
  #   end

  #   def save_authors(authors)
  #     saved_authors = []
  #     authors.each do |author|
  #       saved_authors.push({
  #         first_name: author.first_name
  #         last_name: author.last_name
  #         id: author.id
  #       })
  #   end
  #   File.write('./data/authors.json', JSON.generate(saved_authors))
  # end

  # def save_musics(musics)
  #   mq = []
  #   musics.each do |music|
  #     mq.push({
  #               on_spotify: music.on_spotify,
  #               publish_date: music.publish_date,
  #               genre: music.genre.name,
  #               music_author_fname: music.author.first_name,
  #               music_author_secname: music.author.last_name
  #             })
  #   end
  #   File.write('./musicAlbum/data/musics.json', JSON.generate(mq).to_s)
  # end

  # def save_genres(genres)
  #   gen = []
  #   genres.each do |genre|
  #     gen.push({
  #                name: genre.name
  #              })
  #   end
  #   File.write('./musicAlbum/data/genres.json', JSON.generate(gen).to_s)
  # end
end
