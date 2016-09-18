require 'rails_helper'

RSpec.describe CatchesController, type: :controller do
  context "GET /catches" do
    it "shows all catches for a user" do
      ca =  create(:catch)
      get :index,nil,{ 'HTTP_AUTHORIZATION' =>  'Bearer example@gmail.com'}

      expect(response_json).not_to be_empty
      expect(response_json.size).to equal(1)
      expect(response_json.first["email"]).to equal("example@gmail.com")
    end
  end
end
