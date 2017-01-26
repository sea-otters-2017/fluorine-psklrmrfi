require 'rails_helper'

RSpec.describe UnwelcomeController, type: :controller do
  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the unwelcome page" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
