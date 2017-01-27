require 'rails_helper'

RSpec.describe Robot, type: :model do
  subject(:robot){ FactoryGirl.build(:robot) }
  subject(:on_order_robot){ FactoryGirl.build(:robot, :on_order) }

  describe '#mark_received' do
    it 'marks the robot as in stock' do
      expect(on_order_robot.in_stock).to be false
      on_order_robot.mark_received
      expect(on_order_robot.in_stock).to be true
    end
  end

  describe 'validations' do
    subject(:robot){ FactoryGirl.build(:robot) }

    it 'should have a name' do
      expect(robot).to validate_presence_of :name
    end

    it 'should have a product id' do
      expect(robot).to validate_presence_of :product_id
    end
  end

  describe 'associations' do
    let(:product){ FactoryGirl.create(:product) }
    let(:robot){ FactoryGirl.create(:robot, product: product) }
    it 'belongs to a product' do
      expect(robot).to belong_to(:product)
    end
  end

end
