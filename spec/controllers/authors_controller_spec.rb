require 'rails_helper'

RSpec.describe AuthorsController, :type => :controller do

  describe "GET authors" do
    it "returns http success" do
      get :authors
      expect(response).to have_http_status(:success)
    end
  end

end
