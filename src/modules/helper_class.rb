require_relative './date_handler'

# In this class we'll use helper methods to assist our PushJSONData class
class HelperClass
  def self.date_helper(publish_date)
    until DateHandler.validate_date(publish_date)
      puts 'Wrong format, please input date properly (yyyy-mm-dd).'
      publish_date = gets.chomp
    end
    publish_date
  end

  def self.validation_helper(state)
    case state
    when 'YES', 'Yes', 'yes'
      true
    when 'NO', 'No', 'no'
      false
    else
      puts 'Please enter a valid option (yes/no).'
      state = gets.chomp
      validation_helper(state)
    end
  end

  def self.cover_helper(state)
    case state
    when 'GOOD', 'Good', 'good'
      'Good'
    when 'BAD', 'Bad', 'bad'
      'Bad'
    else
      puts 'Please enter a valid option (good/bad).'
      print 'Cover state (good/bad)?: '
      state = gets.chomp
      cover_helper(state)
    end
  end
end
