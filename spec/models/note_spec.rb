require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "New note" do
    it "creates a new note" do
      note = Note.new(TEST_NOTE)
      expect(note).to have_attributes(TEST_NOTE)
    end
  end
end
