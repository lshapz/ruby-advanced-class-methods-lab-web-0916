class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end 

  def self.create
    song = Song.new
    song.save
    song     
  end 

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end 

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == true 
      return self.name
    else 
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  # def self.new_from_filename(song_mp3)
  #   song = self.new
  #   name = song_mp3.split("-").collect{|x| x}
  #   artist_name = name[0]
  #   artist_name = artist_name.chop
  #   song.artist_name = artist_name
  #   name2 = name[1]
  #   name2 = name2.split(".").collect{|x| x}
  #   name3 = name2[0]
  #   name3.slice!(0)
  #   song.name = name3
  #   song
  # end


def self.new_from_filename(mp3)
  song = self.new
  array = mp3.slice(0..-5).split(' - ')
  artist_name = array[0]
  song.artist_name = artist_name
  song_name = array[1]
  song.name = song_name
  song 
end 

  # def self.new_from_filename(song_mp3)
   


  #   # song = self.new
  #   # songs_array = song_mp3.split("-").collect{|x| x}

  #   # # songs_array = song_mp3.slice(0..-5).split(' - ')
  #   # artist_name = songs_array[0]
  #   # artist_name = artist_name.chop
  #   # song.artist_name = artist_name

  #   # song_name2 = songs_array[1]
  #   # song_name2 = song_name2.split(".").collect{|x| x}
  #   # song_name3 = song_name2[0]
  #   # song_name3.slice!(0)
  #   # song.name = song_name3
  # end 

  def self.create_from_filename(song_mp3)
    new_song = self.new 
    songs_array = song_mp3.slice(0..-5).split(' - ')
    artister_name = songs_array[0]
    songer_name = songs_array[1]
    new_song.artist_name = artister_name
    new_song.name = songer_name 
    new_song.save
  end 

  def self.destroy_all
    @@all.clear
  end 

  def save
    self.class.all << self
  end

end


