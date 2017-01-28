require 'rails_helper'

RSpec.describe Robot, type: :model do
  subject(:robot){ FactoryGirl.create(:robot) }
  subject(:on_order_robot){ FactoryGirl.create(:robot, :on_order) }
  subject(:late_robot){ FactoryGirl.create(:robot, :on_order, :late) }
  subject(:available_robot){ FactoryGirl.create(:robot, :available) }
  subject(:sold_robot){ FactoryGirl.create(:robot, :sold) }

  describe 'Robot::class_methods' do
    describe 'Robot.in_stock' do
      it 'includes robots in stock' do
        robot
        expect(Robot.in_stock.length).to eq(1)
      end
      it 'does not include robots on order' do
        on_order_robot
        expect(Robot.in_stock.length).to eq(0)
      end
    end
    describe 'Robot.on_order' do
      it 'includes robots on order' do
        on_order_robot
        expect(Robot.on_order.length).to eq(1)
      end
      it 'does not include robots in stock' do
        robot
        expect(Robot.on_order.length).to eq(0)
      end
    end
    describe 'Robot.available' do
      it 'includes robots that are available' do
        available_robot
        expect(Robot.available.length).to eq(1)
      end
      it 'does not include robots that arent available' do
        robot
        expect(Robot.available.length).to eq(0)
      end
    end
    describe 'Robot.sold' do
      it 'includes robots on order' do
        sold_robot
        expect(Robot.sold.length).to eq(1)
      end
      it 'does not include robots in stock' do
        available_robot
        expect(Robot.sold.length).to eq(0)
      end
    end
  end

  describe '#mark_received' do
    it 'marks the robot as in stock' do
      expect(on_order_robot.in_stock).to be false
      on_order_robot.mark_received
      expect(on_order_robot.in_stock).to be true
    end
  end

  describe '#past_due?' do
    it 'knows if a robot is past due' do
      expect(late_robot.past_due?).to be true
    end
    it 'knows if a robot is NOT past due' do

      on_order_robot.expected_date = Time.now + 7.days
      on_order_robot.save
      expect(on_order_robot.past_due?).to be false
    end
    it 'knows if a robot is NOT past due' do
      expect(robot.past_due?).to be false
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
