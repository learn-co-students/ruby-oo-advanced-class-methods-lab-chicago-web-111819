require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song_boi = self.new
    song_boi.name = self.name
    @@all << song_boi
    song_boi
    # binding.pry
  end

  def self.create_by_name(song)
    song_boi = self.new
    song_boi.name = song
    @@all << song_boi
    song_boi
  end

  def self.new_by_name(name_of)
    song = self.new
    song.name = name_of
    song
    # puts "hiya"
    # binding.pry
    # song_boi_dos.name
  end

  def self.find_by_name(song_name)
    # array = @@all.map {|song_object| song_object.name }
    @@all.each do|value| 
      if value.name == song_name
        return value 
      end
    end
    return nil
    # binding.pry
  end

  def self.find_or_create_by_name(name_of_song)
    if !self.find_by_name(name_of_song)
      self.create_by_name(name_of_song)
    else
      return self.find_by_name(name_of_song)

    end
  end

  def self.alphabetical
    array = @@all.sort_by{|value| value.name}
    return array
  end

  def self.new_from_filename(name_of_song)
    array = name_of_song.split(" - ")
    not_ = array[1].split(".")
    song_boi = not_[0]
    artist_boi = array[0]
    songy = self.new 
    songy.name = song_boi
    songy.artist_name = artist_boi 
    songy
  end

  def self.create_from_filename(name_of_song)
    array = name_of_song.split(" - ")
    not_ = array[1].split(".")
    song_boi = not_[0]
    artist_boi = array[0]
    songy = self.new 
    songy.name = song_boi
    songy.artist_name = artist_boi 
    @@all << songy
    songy
  end

  def self.destroy_all
    @@all = []
  end
end
# p song = Song.new_by_name("Blank Space")
# p song.name
# p song.name
# p "blank".name