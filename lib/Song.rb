class Song
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap(&:save)
  end

  def self.find_by_name(name)
    all.detect { |song| song.name = name }
  end

  def find_or_create_by_name(name)
    if find_by_name(name).nil?
      create(name)
    end
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(' - ')
    new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    artist, song, genre = filename.split(' - ')
    create(song, artist, genre)
  end

  def self.list_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
