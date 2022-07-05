require_relative './item'
require_relative '../modules/date_handler'

class Game < Item
  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateHandler.from_string(last_played_at)
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end
