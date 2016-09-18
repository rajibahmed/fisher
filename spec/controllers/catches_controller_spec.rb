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
    
      puts response_json.inspect
      expect(response_json).not_to be_empty
      expect(response_json.size).to equal(1)
      expect(response_json.first[:email]).to eq("example@gmail.com")
    end
  end
end
