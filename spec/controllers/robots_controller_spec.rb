require 'rails_helper'

RSpec.describe RobotsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:robot) { FactoryGirl.create(:robot) }
  let!(:new_robot) { FactoryGirl.build(:robot) }

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

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new robot, @robot" do
      get :new
      expect(assigns(:robot)).to be_a_new Robot
    end

    it "renders the :show template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    let(:successful_post) do
      post :create, params: { robot: new_robot.attributes, product_id: new_robot.product.id }
    end
    let(:unsuccessful_post) do
      post :create, params: { robot: new_robot.attributes }
    end
    describe 'for a successful post' do
      it "responds with status code 302" do
        successful_post
        expect(response).to have_http_status 302
      end

      it "creates a new robot" do
        expect{successful_post}.to change(Robot, :count).by(1)
      end

      it "redirects to the :show page" do
        successful_post
        expect(response).to redirect_to Robot.last
      end
    end
    describe 'for a unsuccessful post' do
      it "responds with status code 200" do
        unsuccessful_post
        expect(response).to have_http_status 200
      end

      it "does not create a new robot" do
        expect{unsuccessful_post}.to_not change(Robot, :count)
      end

      it "re-renders the new robot" do
        unsuccessful_post
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      get :edit, params: { id: robot.id }, session: {'user_id': user.id }
    end
    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end

    it "assigns the correct robot as @robot" do
      expect(assigns(:robot)).to eq(robot)
    end

    it "renders the :edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    before(:each) do
      put :update,
          params: { id: robot.id,
                    robot: new_robot.attributes,
                    product_id: new_robot.product.id },
          session: {'user_id': user.id }
    end
    it "responds with status code 302" do
      expect(response).to have_http_status 302
    end

    it "assigns the correct robot as @robot" do
      expect(assigns(:robot)).to eq(robot)
    end

    it "redirects to robot show page" do
      expect(response).to redirect_to Robot.last
    end
  end
end
