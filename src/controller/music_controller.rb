require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/music_album'
require_relative '../modules/helper_class'
require_relative '../modules/push_data'
require_relative '../modules/pull_data'

class MusicAlbumController
  attr_reader :music_albums

  def initialize
    @music_albums = PullJSONData.fetch_music_albums
  end

  def music_sublist
    puts 'Ayy! Please choose an option by entering a number: '
    puts '1. List of Music Albums'
    puts '2. List of Genres'
    puts '3. Add a Music Album'
    puts '4. Return'
    user_choice = gets.chomp

    choices = {
      '1' => -> { read_music_albums },
      '2' => -> { fetch_genres },
      '3' => -> { save_music_albums },
      '4' => -> { UI.new.run }
    }

    if choices.key?(user_choice)
      choices[user_choice].call
    else
      puts 'Invalid input, please enter a valid choice.'
      choices.default = music_sublist
    end
  end

  def save_music_albums
    puts 'Hi-ya! Let\'s create some music. Shall we?'
    print 'Enter the music\'s album publish date (e.g. 2012-12-12): '
    publish_date = HelperClass.date_helper(gets.chomp)
    print 'Is your music on spotify (yes/no)?: '
    on_spotify = HelperClass.validation_helper(gets.chomp)
    print 'Enter the music genre (e.g. Rap, Pop, Rock, Jazz, etc.): '
    genre = Genre.new(gets.chomp)
    print 'Enter the music author\'s name: '
    author = Author.new(gets.chomp)
    music_album = MusicAlbum.new(publish_date, on_spotify)
    music_album.add_genre = genre
    music_album.add_author = author
    @music_albums << music_album
    PushJSONData.commit_albums(@music_albums)
    puts 'Music album has been created succesfully!'
  end

  def read_music_albums
    if @music_albums.empty?
      puts 'No albums has been added yet, please add it.'
    else
      @music_albums.each_with_index do |album, index|
        puts "#{index}) Publish Date: #{album.publish_date},\
  On Spotify: #{album.on_spotify}, Genre: #{album.genre.name},\
  Author: #{album.author.name}"
      end
    end
  end

  def fetch_genres
    if @music_albums.empty?
      puts 'No genres has been added yet, please add it.'
    else
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}) #{album.genre.name}"
      end
    end
  end
end
