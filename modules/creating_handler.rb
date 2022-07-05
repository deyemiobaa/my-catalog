require_relative '../modules/date_handler'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative './app'

module CreatingHandler
  include DateHandler

  @app = App.new
  def self.create_book
    puts "Enter book publisher:"
    publisher = gets.chomp
    puts "Enter book cover state:"
    cover_state = gets.chomp
    puts "Enter book publish date:(yyyy-mm-dd)"
    publish_date = gets.chomp
    while !DateHandler.validate_date(publish_date)
      puts "Invalid date format. Try again:"
      publish_date = gets.chomp
    end
    book = Book.new(publisher, cover_state, publish_date)

    puts "Add a label to the book"
    label = create_label
    book.add_label(label)
    @app.add_book(book)
    puts "Book created successfully!"
  end

  def self.create_label
    puts "Enter label title:"
    title = gets.chomp
    puts "Enter label color:"
    color = gets.chomp
    label = Label.new(title, color)
    @app.add_label(label)
    label
  end
end


CreatingHandler.create_book