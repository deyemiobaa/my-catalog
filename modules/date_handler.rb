require 'date'

module DateHandler
  def from_string(date)
    Date.parse(date)
  end
end
