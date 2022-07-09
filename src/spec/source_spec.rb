require_relative '../classes/source'
require_relative '../classes/item'

describe Source do
  before :all do
    @item = Item.new '2012-12-12', archived: false
  end

  before :each do
    @source = Source.new 'Online Shop'
  end

  context 'when testing the Source class' do
    it 'should return true if object is an instance of the Label class' do
      expect(@source).to be_an_instance_of Source
    end

    it 'should return false when testing the color input equality' do
      expect(@source.name).to eql 'Online Shop'
    end

    it 'should return true if the items[] contains 1 item' do
      @source.add_item(@item)
      expect(@source.items.count).to eq 1
    end
  end
end
