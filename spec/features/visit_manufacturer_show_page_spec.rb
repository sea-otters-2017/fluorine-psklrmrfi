require 'rails_helper'

feature "visiting the products index page" do
  background do
    @product = FactoryGirl.create(:product)
  end
  scenario "a user can visit the products index page" do
    visit manufacturer_path(@product.manufacturer)
    expect(page.html).to include(@product.manufacturer.name)
  end
end
