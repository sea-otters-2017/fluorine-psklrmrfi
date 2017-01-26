require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe 'validations' do
    let!(:manufacturer) { Manufacturer.create!(name: 'Acme Robot') }
    it 'should have a name' do
      expect(manufacturer).to validate_presence_of :name
    end
  end
end



