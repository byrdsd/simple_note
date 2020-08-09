module NotesHelper
  def pretty_date timestamp
    return nil if timestamp.nil?
    time = Time.at(timestamp.to_i)
    time.strftime("%a %b %d, %Y at %I:%M %p")
  end
end
