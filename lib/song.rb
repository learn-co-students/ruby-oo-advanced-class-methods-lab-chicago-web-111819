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
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    return self.all.find{ |person| person.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      song = self.create_by_name(name)
    end
    return song
  end

  def self.alphabetical
    return self.all.sort_by! { |song| song.name.upcase }
  end

  def self.new_from_filename(file_name)
    # song and artist name
    pcs = self.song_artist(file_name)
    # Take care of the song instance
    song = self.new
    song.name = pcs[0]
    song.artist_name = pcs[1]

    return song
  end

  def self.create_from_filename(file_name)
    # song and artist name
    pcs = self.song_artist(file_name)
    # Take care of the song instance
    song = self.new
    song.name = pcs[0]
    song.artist_name = pcs[1]
    @@all << song

    return song
  end

  def self.destroy_all
    return self.all.clear
  end

  # === Helper methods ===
  private
    def self.song_artist(file_name)
      parts = []
      # split the given string into the artist name and the song name
      f_name_parts = file_name.split(" - ")
      # extract the artist name
      a_name = f_name_parts[0]
      # extract the song name removing the file ending
      s_name = f_name_parts[1].split(".")[0]

      parts << s_name
      parts << a_name

      return parts
    end

end
