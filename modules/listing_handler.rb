require_relative './app'

@app = App.new

module ListingHandler
  def self.list_books
    @app.books.each_with_index do |book, index|
      puts "- #{index}) Title: #{book.label.title} Publisher: #{book.publisher} Author: #{book.author.first_name} #{book.author.last_name}"
    end
  end
  
  def self.list_labels
    @app.labels.each_with_index do |label, index|
      puts "- #{index}) Title: #{label.title} Color: #{label.color}"
    end
  end
end