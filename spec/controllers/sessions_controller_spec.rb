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
      before(:each) do
        post :create,
        params: {session: {password: user.password}},
        session: {'user_id': user.id }
      end

      it { is_expected.to redirect_to robots_path }
      it {is_expected.to set_session}
    end

    describe 'unsuccessful login' do
      before(:each) do
        post :create,
        params: {session: {password: 'wrong'}},
        session: {'user_id': user.id }
      end

      it { is_expected.to redirect_to root_path }
      it { is_expected.to set_flash[:error] }
      it { is_expected.not_to set_session[:admin] }
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
      expect(controller).to set_flash
    end

    it 'destroys the session' do
      controller.session[:user_id] = user.id
      delete :destroy
      expect(controller.session[:admin]).to be false
      expect(controller.session[:user_id]).to be nil
    end
  end
end
