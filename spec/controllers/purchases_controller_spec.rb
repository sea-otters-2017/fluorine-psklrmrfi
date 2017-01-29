require 'rails_helper'

RSpec.describe PurchasesController do
  let!(:robot) { FactoryGirl.create(:robot) }
  let!(:new_purchase) { FactoryGirl.build(:purchase) }

  describe 'POST #create' do
    let(:successful_post) do
      post :create, params: { robot_id: robot.id, purchase: new_purchase.attributes }
    end

    let(:unsuccessful_post) do
      post :create, params: { robot_id: robot.id, purchase: {name: new_purchase.name} }
    end

    it 'responds 302 for a successful post' do
      successful_post
      expect(response).to have_http_status(302)
    end

    describe 'for a unsuccessful post' do
      it "responds with status code 200" do
        unsuccessful_post
        expect(response).to have_http_status 302
      end

      it "does not create a new purchase" do
        expect{unsuccessful_post}.to_not change(Purchase, :count)
      end

      it "re-displays the same robot" do
        unsuccessful_post
        expect(response).to redirect_to robot_path(robot)
      end
    end
  end
end
