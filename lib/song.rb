class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @name = name 
  #   @artist_name = artist_name
  # end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song 
    song 
  end 

  ## created the song, gave it the name, and returned it
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song 
  end 

  ## created a new song with the name given and 
  ## saved the song using the initiate save method 
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song.save 
    song 
  end

  ##based on the name given, find the song. 
  ## used find method because find will return the first item that equals true 
  def self.find_by_name(song_name)
    @@all.find {|list| list.name == song_name}
  end 

  ## this will either findthe song by name or create the same by name 
  def self.find_or_create_by_name(song_name)
    self.create_by_name(song_name)
    self.find_by_name(song_name)
  end 

  ##this method finds the existing array containing all songs
  ## the sort_by method then sort by the song name 
  def self.alphabetical
    self.all.sort_by{ |song| song.name} 
  end 

  def self.new_from_filename(new_song)
    song = self.new
    song.name = (new_song.split(" - ")[1].chomp(".mp3")).strip 
    song.artist_name = (new_song.split(" - ")[0])
    song 
  end 

  def self.create_from_filename(new_song)
    song = self.new_from_filename(new_song)
    song.save 
    song 
  end 

  def self.destroy_all
    @@all.clear 
  end 
end
