require_relative '../classes/game'
require_relative '../classes/item'

describe Game do
  before(:all) do
    @game = Game.new('Faker', '2019-04-05', '1997-12-24')
  end

  it 'check if object is of class Item' do
    expect(@game).to_not be_instance_of Item
  end

  it 'check if object is of class Game' do
    expect(@game).to be_instance_of Game
  end

  it 'can be archived if last played time old enough' do
    expect(@game.can_be_archived?).to eq true
  end
end