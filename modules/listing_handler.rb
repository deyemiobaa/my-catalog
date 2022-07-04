require_relative './app'

@app = App.new

module ListingHandler
  def self.list_books
    @app.books.each_with_index do |book, index|
      puts "- #{index}) Title: #{book.label.title} Publisher: #{book.publisher}\
Author: #{book.author.first_name} #{book.author.last_name}"
    end
  end

  def self.list_labels
    @app.labels.each_with_index do |label, index|
      puts "- #{index}) Title: #{label.title} Color: #{label.color}"
    end
  end

  def self.list_genres
    uniq_genres = @app.musics.uniq { |x| x.genre.name }
    uniq_genres.each_with_index do |s, index|
      puts "#{index + 1}) #{s.genre.name}"
    end
  end

  def self.list_music
    @app.musics.each_with_index do |mq, index|
      print "#{index}) On spotify: #{mq.on_spotify}, Publish date: #{mq.publish_date}, genre #{mq.genre.name}, "
      print "Author: #{mq.author.first_name} #{mq.author.last_name}"
    end
  end
end
