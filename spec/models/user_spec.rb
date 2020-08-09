require 'rails_helper'

RSpec.describe User, type: :model do
  describe "New user" do
    it "creates a new user" do
      user = User.new(
        username: "joe",
        password: "123",
        email: "joe@joesplace.com"
      )
      expect(user).to have_attributes(
        username: "joe",
        password: "123",
        email: "joe@joesplace.com"
      )
    end
  end
end
