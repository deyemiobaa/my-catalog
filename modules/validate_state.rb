module ValidateState
  def self.check_spotify_state(state)
    case state
    when 'yes'
      true
    when 'no'
      false
    else
      puts 'That was an invalid option'
      puts ''
      print 'Is your music on spotify? (yes/no) '
      state = gets.chomp
      check_spotify_state(state)
    end
  end
end
