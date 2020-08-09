require 'rails_helper'

TEST_NOTE = {
  title: "My Note",
  body: "Remember to write more notes",
  timestamp: "1596945504"
}

RSpec.describe Note, type: :model do
  describe "New note" do
    it "creates a new note" do
      note = Note.new(TEST_NOTE)
      expect(note).to have_attributes(TEST_NOTE)
    end
  end
end
