class Genre
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    @songs.each(&:artist)
  end
end
