require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  before :all do
    @item = Item.new '2012-12-12', archived: false
  end

  before :each do
    @label = Label.new 'Gift', 'Red'
  end

  context 'when testing the Label class' do
    it 'should return true if object is an instance of the Label class' do
      expect(@label).to be_an_instance_of Label
    end

    it 'should return true when testing the color input equality' do
      expect(@label.color).to eql 'Red'
    end

    it 'should return false when testing the color input equality' do
      boolean = @label.title == 'New'
      expect(boolean).to be false
    end

    it 'should return true if the items[] contains 1 item' do
      @label.add_item(@item)
      expect(@label.items.count).to eq 1
    end
  end
end
