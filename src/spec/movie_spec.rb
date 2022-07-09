require_relative '../classes/movie'

describe Movie do
  before :each do
    @movies = Movie.new 'Spiderman', false, '2002-03-14'
  end

  context 'when testing the Movie class' do
    it 'should return true if object is an instance of the Movie class' do
      expect(@movies).to be_an_instance_of Movie
    end

    it 'should return false when acquiring the silent property' do
      expect(@movies.silent).to be false
    end

    it 'should return true if a given input equals the publish_date property' do
      expect(@movies.publish_date).to eql(DateHandler.from_string('2002-03-14'))
    end

    it 'should return true when calling the can_be_archived? method' do
      expect(@movies.can_be_archived?).to be true
    end
  end
end
