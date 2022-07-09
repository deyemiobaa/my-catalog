require_relative '../modules/pull_data'
require_relative '../modules/push_data'
require_relative '../classes/source'
require_relative '../classes/movie'
require_relative '../modules/helper_class'

class MovieController
  def initialize
    @movies = PullJSONData.fetch_movies
  end

  def movies_sublist
    puts 'Ayy! Please choose an option by entering a number: '
    puts '1. List of Movies'
    puts '2. List of Sources'
    puts '3. Add a Movie'
    puts '4. Return'
    user_choice = gets.chomp

    choices = {
      '1' => -> { read_movies },
      '2' => -> { read_sources },
      '3' => -> { save_movies },
      '4' => -> { UI.new.run }
    }

    if choices.key?(user_choice)
      choices[user_choice].call
    else
      puts 'Invalid input, please enter a valid choice.'
      choices.default = movies_sublist
    end
  end

  def save_movies
    puts 'Hi-ya! Let\'s create some movies. Shall we?'
    print 'Enter the name of the movie (e.g. The Godfather, Fast & Furious, etc.): '
    name = gets.chomp
    print 'Enter the movie genre (e.g. Comedy, Action, Thriller, etc.): '
    genre = Genre.new(gets.chomp)
    print 'Is this a silent movie, or more generally, no audible dialogue? (yes/no): '
    silent = HelperClass.validation_helper(gets.chomp)
    print 'Enter the publish date (e.g. 2003-08-21): '
    publish_date = HelperClass.date_helper(gets.chomp)
    print 'Enter the source of a movie (e.g. From a friend, Online shop, etc.): '
    source = Source.new(gets.chomp)
    movie = Movie.new(name, silent, publish_date)
    movie.add_genre = genre
    movie.add_source = source
    @movies << movie
    PushJSONData.commit_movies(@movies)
    puts 'Movie has been created succesfully!'
  end

  def read_movies
    if @movies.empty?
      puts 'No movies has been added yet, please add it.'
    else
      @movies.each_with_index do |movie, index|
        puts "#{index}) Movie Name: #{movie.name},\
 Movie Genre: #{movie.genre.name}, Silent: #{movie.silent},\
 Publish Date: #{movie.publish_date}, Movie Source: #{movie.source.name}"
      end
    end
  end

  def read_sources
    if @movies.empty?
      puts 'No sources has been added yet, please add it.'
    else
      @movies.each_with_index do |movie, index|
        puts "#{index + 1}) #{movie.source.name}"
      end
    end
  end
end
