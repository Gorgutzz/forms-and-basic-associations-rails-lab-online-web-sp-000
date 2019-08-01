class Song < ActiveRecord::Base
  # add associations here
    def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        note = Note.find_or_create_by(content: note)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map {|n| n.content}
  end

end
