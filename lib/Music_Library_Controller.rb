class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = nil
    puts 'Whatcu want fool?'
      while input != 'exit'
        input = gets.strip
        case input
        when 'exit'
          puts 'I pity the fool!'
          sleep 3
        end

      end
  end

  def songs
    Song.all.each_with_index do |s, i|
      puts "#{i}. #{Song.list_song(s)}"
    end
  end

  def artists
    Artist.all.each { |o| puts o.name }
  end

  def genres
    Genre.all.each { |o| puts o.name }
  end

  def play_song
    puts 'Which number fool?'
    input = gets.strip.to_i
    puts "Playing #{Song.list_song(input)}"
  end

  def songs_by_artist
    puts 'Good choice fool, which artist?'
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.each do |s|
        puts Song.list_song(s).to_s
      end
    end
  end

  def songs_by_genre
    puts 'Which genre fool?'
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.each do |s|
        puts Song.list_song(s).to_s
      end
    end
  end

end
