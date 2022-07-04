require_relative '../classes/book'

describe Book do
  before(:each) do
    @book = Book.new('publisher', 'good', '2000-01-01')
  end

  it 'can be archived if it is bad' do
    @book.move_to_archive
    expect(@book.archived).to be_truthy
  end

  it 'should be an instace of Book class' do
    expect(@book).to be_instance_of(Book)
  end
end