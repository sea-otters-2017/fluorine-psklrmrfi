require 'rails_helper'

RSpec.describe RobotsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:robot) { FactoryGirl.create(:robot) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index, session: {'user_id': user.id }
      expect(response).to have_http_status 200
    end

    it "assigns all robots as @robots" do
      get :index, session: {'user_id': user.id }
      expect(assigns(:robots)).to eq Robot.all
    end

    it "renders the :index template" do
      get :index, session: {'user_id': user.id }
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: robot.id }, session: {'user_id': user.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct robot as @robot" do
      get :show, params: { id: robot.id }, session: {'user_id': user.id }
      expect(assigns(:robot)).to eq(robot)
    end

    it "renders the :show template" do
      get :show, params: { id: robot.id }, session: {'user_id': user.id }
      expect(response).to render_template(:show)
    end
  end


end
