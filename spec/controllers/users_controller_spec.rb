require "rails_helper"

RSpec.describe UsersController, type: :controller do

  describe "#create" do
    it "creates a new user" do
      mdb = instance_double("Mongoid::Persistable::Savable")
      user = class_double("User").
        as_stubbed_const(transfer_nested_constants: true)
      allow(user).to receive(:find_by).and_return(_id: "1")
      allow(user).to receive(:new).and_return(TEST_USER)
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
