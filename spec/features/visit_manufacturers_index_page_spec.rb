require 'rails_helper'

feature "visiting the manufacturers index page" do
  scenario "the user sees a list of manufacturers" do
    visit manufacturers_path
    expect(page.html).to include("Manufacturers")
  end
end
