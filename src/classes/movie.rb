require_relative 'item'

class Movie < Item
  attr_accessor :name, :silent, :publish_date

  def initialize(name, silent, publish_date)
    super(publish_date)
    @name = name
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
