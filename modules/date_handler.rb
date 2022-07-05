require 'date'

module DateHandler
  def self.from_string(date)
    Date.parse(date)
  end

  def self.validate_date(date)
    date =~ /\d{4}-\d{2}-\d{2}/ ? true : false
  end
end
