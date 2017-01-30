require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:manufacturer) { Manufacturer.create!(name: 'Acme Robots') }
  let!(:product) { Product.create!(model_number: 'XY-123', price: 95000, height: 40, weight: 80, manufacturer_id: manufacturer.id ) }

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { manufacturer_id: manufacturer.id, id: product.id}, session: {'user_id': user.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct product as @product" do
      get :show, params: { manufacturer_id: manufacturer.id, id: product.id}, session: {'user_id': user.id }
      expect(assigns(:product)).to eq(product)
    end

    it "renders the :show template" do
      get :show, params: { manufacturer_id: manufacturer.id, id: product.id}, session: {'user_id': user.id }
      expect(response).to render_template(:show)
    end
  end
end
