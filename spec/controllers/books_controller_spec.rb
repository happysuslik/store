require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  describe "GET books" do
    it "returns http success" do
      get :books
      expect(response).to have_http_status(:success)
    end
  end

end
