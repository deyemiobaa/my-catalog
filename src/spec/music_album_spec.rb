require_relative '../classes/music_album'

describe MusicAlbum do
  before :each do
    @musics = MusicAlbum.new '2012-12-12', false
  end

  context 'when testing the MusicAlbum class' do
    it 'should return true if object is an instance of the MusicAlbum class' do
      expect(@musics).to be_an_instance_of MusicAlbum
    end

    it 'should return false when acquiring the on_spotify property' do
      expect(@musics.on_spotify).to be false
    end

    it 'should return true if a given input equals the publish_date property' do
      expect(@musics.publish_date).to eql(DateHandler.from_string('2012-12-12'))
    end

    it 'should return false when calling the can_be_archived? method' do
      expect(@musics.can_be_archived?).to be false
    end
  end
end
