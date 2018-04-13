require 'rails_helper'

RSpec.describe BoardController, type: :controller do

  describe "GET #get_ids" do
    it "returns http success" do
      get :get_ids
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
