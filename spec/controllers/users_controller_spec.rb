require "rails_helper"

RSpec.describe UsersController, type: :controller do

  describe "#create" do
    it "creates a new user" do
      user = double(TEST_USER)
      mdb = instance_double("Mongoid::Persistable::Savable")
      allow(User).to receive(:find_by) { user }
      allow(User).to receive(:new) { user }
      allow(user).to receive(:[]) { Time.new.to_i }
      allow(mdb).to receive(:save).and_return(true)
      post :create, params: { user: {
        username: "joe",
        password: "123",
        email: "joe@joesplace.com"
      }}
      expect(response.location).to eq("#{HOST}#{notes_path}")
    end
  end
end
