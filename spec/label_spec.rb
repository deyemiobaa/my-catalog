require_relative '../classes/book'
require_relative '../classes/label'

describe Label do
  before(:each) do
    @label = Label.new('title', 'color')
  end

  it 'should be an instance of Label class' do
    expect(@label).to be_instance_of(Label)
  end

  it 'should have a title' do
    expect(@label.title).to eq('title')
  end

  it 'should have a color' do
    expect(@label.color).to eq('color')
  end

  it 'should have an array of items' do
    expect(@label.items).to be_instance_of(Array)
  end

  it 'should add an item to the array' do
    @label.add_item(Book.new('publisher', 'good', '2000-01-01'))
    expect(@label.items.length).to eq(1)
  end
end