require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "#create" do

    it "creates a session when signin is successful" do
      user = double(TEST_USER)
      allow(User).to receive(:find_by) { user }
      allow(user).to receive(:[]) { Time.new.to_i }
      post :create, params: { login: { username: "joe", password: "123" } }
      expect(response.location).to eq("#{HOST}#{notes_path}")
    end

    it "returns to the login page when signin is unsuccessful" do
      user = double(TEST_USER)
      allow(User).to receive(:find_by) { nil }
      post :create, params: { login: { username: "joe", password: "123" } }
      expect(response.location).to eq("#{HOST}#{sessions_path}")
    end
  end
end
