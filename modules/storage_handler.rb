module StorageData
  def save_games(games)
    saved_games = []
    games.each do |game|
      saved_games << {
        multiplayer: game.multiplayer
        publish_date: game.publish_date
        last_played_at: game.last_played_at
      }
    end
    File.write('./data/books.json', JSON.generate(saved_games))
  end

  def save_authors(authors)
    saved_authors = []
    authors.each do |author|
      saved_authors << {
        first_name: author.first_name
        last_name: author.last_name
        id: author.id
      }
    File.write('./data/authors.json', JSON.generate(saved_authors))
  end
