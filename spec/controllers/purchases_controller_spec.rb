require 'rails_helper'

RSpec.describe PurchasesController do
  let!(:robot) { FactoryGirl.create(:robot) }

  # describe 'POST #create' do
  #   it 'saves the purchase with valid params' do
  #     purchase_params = FactoryGirl.attributes_for(:purchase)
  #     purchase_params[:robot_id] = robot.id
  #     count = Purchase.count
  #     post :create, purchase: purchase_params
  #     expect(Purhcase.count).to eq(count + 1)
  #   end

  #   it 'redirects to robot_show_page if purchase does not save' do
  #     post :create, robot_id: robot.id
  #     expect(response).to redirect_to robot_path(robot)
  #   end
  # end

end
