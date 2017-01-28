require 'rails_helper'

RSpec.describe PurchasesController do
  let!(:robot) { FactoryGirl.create(:robot) }
  let!(:new_purchase) { FactoryGirl.build(:purchase) }

  describe 'POST #create' do
    let(:successful_post) do
      post :create, params: { robot_id: robot.id, purchase: new_purchase.attributes }
    end

    it 'responds 302 for a successful post' do
      successful_post
      expect(response).to have_http_status(302)
    end

    it 'redirects to robot_show_page if purchase does not save' do
      post :create, robot_id: robot.id
      expect(response).to redirect_to robot_path(robot)
    end
  end

end
