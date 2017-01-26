require 'rails_helper'

RSpec.describe Robot, type: :model do

  describe 'validations' do
    subject(:robot){ FactoryGirl.build(:robot) }

    it 'should have a name' do
      expect(robot).to validate_presence_of :name
    end

    it 'should have a product id' do
      expect(robot).to validate_presence_of :product_id
    end
  end
end
