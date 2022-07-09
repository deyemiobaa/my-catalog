require_relative '../classes/game'
require_relative '../modules/helper_class'

describe Game do
  before :each do
    @game = Game.new 'No', '2000-01-01', '2006-05-02'
  end

  context 'when testing the Game class' do
    it 'should return true if object is an instance of the Game class' do
      expect(@game).to be_an_instance_of Game
    end

    it 'should return false when acquiring the multiplayer property' do
      expect(HelperClass.validation_helper(@game.multiplayer)).to be false
    end

    it 'should return true if a given input equals the publish_date property' do
      expect(@game.publish_date).to eql(DateHandler.from_string('2006-05-02'))
    end

    it 'should return true when calling the can_be_archived? method' do
      expect(@game.can_be_archived?).to be true
    end
  end
end
