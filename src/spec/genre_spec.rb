require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  before :all do
    @item = Item.new '2022-12-22', archived: false
  end

  before :each do
    @genre = Genre.new 'Rap'
  end

  context 'when testing the Genre class' do
    it 'should return true if object is an instance of the Genre class' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'should return true if the items[] contains 1 item' do
      @genre.add_item(@item)
      expect(@genre.items.count).to eq 1
    end
  end
end
