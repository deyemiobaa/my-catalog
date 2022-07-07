class Label
  attr_reader :title, :color
  attr_accessor :items

  def initialize(title, color)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*_args)
    {
      title: @title,
      color: @color
    }.to_json
  end

  def self.from_json(string)
    data = JSON.parse(string)
    new(data['title'], data['color'])
  end
end
