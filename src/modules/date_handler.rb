require 'date'

# Returns Date object from given String input
module DateHandler
  def self.from_string(date)
    Date.parse(date)
  end

  # Returns String object from the given Date input in 'yyyy-mm-dd' format
  def self.to_string(date)
    date.strftime('%Y-%m-%d')
  end

  # Validate date in correct format yyyy-mm-dd
  def self.validate_date(date)
    # date =~ /\d{4}-\d{2}-\d{2}/ ? true : false
    date =~ /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/ ? true : false
  end
end
