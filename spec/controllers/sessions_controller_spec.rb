require 'rails_helper'

RSpec.describe SessionsController do
  let!(:user) { FactoryGirl.create(:user) }

  describe 'GET #new' do
    it 'displays the login page' do
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe 'POST #create' do
    it 'displays the login page' do
      controller.session[:user_id] = user.id
      p controller.params
      post :create, session: { user_id: user.id}
      expect(response).to have_http_status 200
    end
  end

  describe 'DELETE #destroy' do
    it 'redirects to the unwelcome page' do
      delete :destroy
      expect(response).to have_http_status 302
    end

    it 'redirects to the unwelcome page' do
      delete :destroy
      expect(response).to redirect_to root_path
    end
  end
end
