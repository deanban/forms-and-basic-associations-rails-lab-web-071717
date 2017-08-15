class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # attr_accessor :genre_name, :artist_name
  # attr_writer :note_contents

  def note_contents
  	# arr = []
  	# Note.all.each do |n|
  	# 	if n.song_id == self.id
  	# 		arr << n.content 
  	# 	end
  	# end
  	# byebug
  	# arr
  	arr = []
  	self.notes.each do |n|
  		arr << n.content
  	end
  	arr
  end

  def note_contents=(notes)
  	notes.each do |n|
  		self.save
  		if n != nil && n != ''
  	  		n.strip!
  			self.notes.build(content: n)
  		end
  	end
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by(name: name)
 	self.artist = @artist
  end

  def genre_name=(name)
    @genre = Genre.find_or_create_by(name: name)
 	self.genre = @genre
  end

  def artist_name
  	self.artist.name
  end

  def genre_name 
  	self.genre.name
  end


end

