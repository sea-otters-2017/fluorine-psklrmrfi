require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    let!(:manufacturer) { Manufacturer.create!(name: 'Acme Robots') }
    let!(:product) { Product.create!(model_number: 'XY-123', height: 40, weight: 80, manufacturer_id: manufacturer.id, price: 95000 ) }

    it 'should have a model number' do
      expect(product).to validate_presence_of :model_number
    end

    it 'should have a height' do
      expect(product).to validate_presence_of :height
    end

    it 'should have a weight' do
      expect(product).to validate_presence_of :weight
    end

    it 'should have a manufacturer id' do
      expect(product).to validate_presence_of :manufacturer_id
    end
  end
end
