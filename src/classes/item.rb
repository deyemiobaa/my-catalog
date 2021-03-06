require_relative '../modules/date_handler'

class Item
  attr_reader :genre, :author, :label, :source, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = DateHandler.from_string(publish_date)
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private :can_be_archived?
end
