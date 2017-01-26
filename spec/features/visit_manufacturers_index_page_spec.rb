require 'rails_helper'

feature "visiting the manufacturers index page" do
  scenario "the user can visit the manufacturers index page" do
    visit manufacturers_path
    expect(page.html).to include("Manufacturers")
  end

  scenario "the user can see a list of all manufacturers" do
    visit manufacturers_path
    expect(page).to have_content(:manufacturers)
  end
end
