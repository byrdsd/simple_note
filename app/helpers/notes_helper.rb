module NotesHelper
  def pretty_date timestamp
    return nil if timestamp.nil?
    time = Time.at(timestamp.to_i)
    time.strftime("%a %b %d, %Y at %I:%M %p")
  end

  def show_title note
    return note.title if !note.title.empty?
    note.body.truncate(30, { separator: /\s/ })
  end
end
