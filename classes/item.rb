require_relative '../modules/date_handler'

class Item
  attr_accessor :publish_date, :source, :author, :genre, :label, :archived

  def initialize(publish_date)
    @id = Random.rand(1..100)
    @publish_date = DateHandler.from_string(publish_date)
    @archived = false
    @label = nil
    @genre = nil
    @author = nil
    @source = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  private

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end
end
