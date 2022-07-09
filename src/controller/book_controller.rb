require_relative '../modules/pull_data'
require_relative '../modules/push_data'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/book'
require_relative '../modules/helper_class'

class BookController
  def initialize
    @books = PullJSONData.fetch_books
  end

  def books_sublist
    puts 'Ayy! Please choose an option by entering a number: '
    puts '1. List of Books'
    puts '2. List of Labels'
    puts '3. Add a Book'
    puts '4. Return'
    user_choice = gets.chomp

    choices = {
      '1' => -> { read_books },
      '2' => -> { read_labels },
      '3' => -> { save_books },
      '4' => -> { UI.new.run }
    }

    if choices.key?(user_choice)
      choices[user_choice].call
    else
      puts 'Invalid input, please enter a valid choice.'
      choices.default = books_sublist
    end
  end

  def save_books
    puts 'Hi-ya! Let\'s create some music. Shall we?'
    print 'Enter the books\'s publisher (e.g. RELX Group, Pearson, Simon & Schuster, Macmillan, etc.): '
    publisher = gets.chomp
    print 'Cover state (good/bad)?: '
    cover_state = HelperClass.cover_helper(gets.chomp)
    print 'Enter the publish date (e.g. 2011-11-11): '
    publish_date = HelperClass.date_helper(gets.chomp)
    print 'Enter the book\'s label name (e.g. Gift, New, etc.): '
    label_title = gets.chomp
    print 'Enter the book\'s color (e.g. Red, Blue, Green, etc.): '
    book_color = gets.chomp
    print 'Enter the book author\'s name: '
    author = Author.new(gets.chomp)
    label = Label.new(label_title, book_color)
    game = Book.new(publisher, cover_state, publish_date)
    game.add_label = label
    game.add_author = author
    @books << game
    PushJSONData.commit_books(@books)
    puts 'Book has been created succesfully!'
  end

  def read_books
    if @books.empty?
      puts 'No books has been added yet, please add it.'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Publish Date: #{book.publish_date}, Author: #{book.author.name},\
 Publisher: #{book.publisher}, Cover State #{book.cover_state}, Color: #{book.label.color},\
 Label: #{book.label.title} "
      end
    end
  end

  def read_labels
    if @books.empty?
      puts 'No labels has been added yet, please add it.'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) #{book.label.title}"
      end
    end
  end
end
