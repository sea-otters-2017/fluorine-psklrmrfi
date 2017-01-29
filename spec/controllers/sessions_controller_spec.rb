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
    describe 'successful login' do
      it 'displays the login page' do
        p controller.params
        post :create, session: { user_id: user.id}
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'redirects to the unwelcome page (status code)' do
      controller.session[:user_id] = user.id
      delete :destroy
      expect(response).to have_http_status 302
    end

    it 'redirects to the unwelcome page (redirect_to)' do
      controller.session[:user_id] = user.id
      delete :destroy
      expect(response).to redirect_to root_path
    end

    it 'destroys the session' do
      controller.session[:user_id] = user.id
      delete :destroy
      expect(controller.session[:admin]).to be false
      expect(controller.session[:user_id]).to be nil
    end
  end
end
