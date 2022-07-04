require 'date'

module DateHandler
  def self.from_string(date)
    Date.parse(date)
  end
end
