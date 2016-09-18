require 'rails_helper'

RSpec.describe CatchesController, type: :controller do
  context "GET /catches" do
    it "show errors when unauthorized" do
      get :index

      expect(response.status).to eq(401)
      expect(response_json).not_to be_empty
    end

    it "shows all catches for a user" do
      ca =  create(:catch)
      request.headers[:authorization] = "Bearer #{ca.email}"

      get :index

      expect(response_json).not_to be_empty
      expect(response_json.size).to equal(1)
      expect(response_json.first[:email]).to eq("example@gmail.com")
    end
  end

  context "POST /catches" do
    it "creates a catch when params are valid" do
      katch = attributes_for(:catch)
      request.headers[:authorization] = "Bearer #{katch[:email]}"

      post :create, params: {catch: katch}

      expect(response.status).to eq(201)
      expect(response_json[:species]).to eq("fish1")
    end

    it "show errors on validation error" do
      katch = { email: "example@gmal.com" }
      request.headers[:authorization] = "Bearer #{katch[:email]}"

      post :create, params: {catch: katch}

      expect(response.status).to eq(422)
    end
  end
end
