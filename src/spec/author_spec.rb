require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :all do
    @item = Item.new '2012-12-12', archived: false
  end

  before :each do
    @author = Author.new 'Steven King'
  end

  context 'when testing the Author class' do
    it 'should return true if object is an instance of the Author class' do
      expect(@author).to be_an_instance_of Author
    end

    it 'should return true when testing the color input equality' do
      expect(@author.name).to eql 'Steven King'
    end

    it 'should return true if the items[] contains 1 item' do
      @author.add_item(@item)
      expect(@author.items.count).to eq 1
    end
  end
end
