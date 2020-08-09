require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "#create" do

    it "creates a session when signin is successful" do
      user = class_double("User").
        as_stubbed_const(transfer_nested_constants: true)
      allow(user).to receive(:find_by).and_return(id: "1")
      post :create, params: { login: { username: "joe", password: "123" } }
      expect(response.location).to eq("#{HOST}#{notes_path}")
    end

    it "returns to the login page when signin is unsuccessful" do
      user = class_double("User").
        as_stubbed_const(transfer_nested_constants: true)
      allow(user).to receive(:find_by).and_return(nil)
      post :create, params: { login: { username: "joe", password: "123" } }
      expect(response.location).to eq("#{HOST}#{sessions_path}")
    end
  end
end
