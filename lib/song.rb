class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    newSong = self.new
    newSong.save
    newSong
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name name
    newSong = self.new
    newSong.name = name
    newSong
  end

  def self.create_by_name name
    newSong = self.new
    newSong.name = name
    newSong.save
    newSong
  end

  def self.find_by_name name
    all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name name
    song = self.find_by_name name
    song ? song : (self.create_by_name name)
  end

  def self.alphabetical 
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename filename 
    arr = filename.split("-")
    newSong = self.new_by_name arr[1].split(".")[0].strip
    newSong.artist_name = arr[0].strip
    newSong
  end

  def self.create_from_filename filename 
    newSong = self.new_from_filename filename
    newSong.save
    newSong
  end

  def self.destroy_all 
    @@all = []
  end
end
