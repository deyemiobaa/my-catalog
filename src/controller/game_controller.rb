require_relative '../modules/pull_data'
require_relative '../modules/push_data'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/book'
require_relative '../modules/helper_class'

class GameController
  def initialize
    @games = PullJSONData.fetch_games
  end

  def games_sublist
    puts 'Ayy! Please choose an option by entering a number: '
    puts '1. List of Games'
    puts '2. List of Authors'
    puts '3. Add a Game'
    puts '4. Return'
    user_choice = gets.chomp

    choices = {
      '1' => -> { read_games },
      '2' => -> { read_authors },
      '3' => -> { save_games },
      '4' => -> { UI.new.run }
    }

    if choices.key?(user_choice)
      choices[user_choice].call
    else
      puts 'Invalid input, please enter a valid choice.'
      choices.default = games_sublist
    end
  end

  def save_games
    puts 'Hi-ya! Let\'s create some games. Shall we?'
    print 'Is this game a multiplayer? (yes/no): '
    multiplayer = HelperClass.validation_helper(gets.chomp)
    print 'When was the game last time played (e.g. 2022-08-12)?: '
    last_played_at = HelperClass.date_helper(gets.chomp)
    print 'Enter the games\' author\'s name: '
    author = Author.new(gets.chomp)
    print 'Enter the publish date (e.g. 2005-05-11): '
    publish_date = HelperClass.date_helper(gets.chomp)
    game = Game.new(multiplayer, last_played_at, publish_date)
    game.add_author = author
    @games << game
    PushJSONData.commit_games(@games)
    puts 'Game has been created succesfully!'
  end

  def read_games
    if @games.empty?
      puts 'No games has been added yet, please add it.'
    else
      @games.each_with_index do |game, index|
        puts "#{index}) Publish Date: #{game.publish_date},\
 Author: #{game.author.name}, Multiplayer: #{game.multiplayer},\
 Last Time Played: #{game.last_played_at}"
      end
    end
  end

  def read_authors
    if @games.empty?
      puts 'No authors has been added yet, please add it.'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1}) #{game.author.name}"
      end
    end
  end
end
