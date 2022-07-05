require_relative '../classes/author'
require_relative '../classes/game'

describe Author do
  before(:all) do
    @author = Author.new('king', 'fritz')
  end

  it 'check if object is of class Game' do
    expect(@author).to be_instance_of Author
  end

  it 'check the first_name of author' do
    expect(@author.first_name).to eq 'king'
  end

  it 'an item should be added to items array' do
    @author.items.push(Game.new('Faker', '2019-04-05', '1997-12-24'))
    game_player = @author.items[0].multiplayer
    expect(game_player).to eq 'Faker'
  end
end
