require 'rails_helper'

RSpec.describe ProductsHelper, type: :helper do
  describe 'admin sees the wholesale price' do
    let!(:user_is_admin?) { true }

    it 'shows the actual price in dollars' do
      expect(display_price(30000)).to eq 300
    end
  end

  describe 'non-admin sees the retail price' do
    let!(:user_is_admin?) { false }

    it 'shows double the price in dollars' do
      expect(display_price(30000)).to eq 600
    end
  end
end
