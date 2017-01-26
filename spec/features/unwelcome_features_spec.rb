require "rails_helper"

RSpec.feature 'UnwelcomeController', :type => :feature do
  scenario "User visits the unwelcome page" do
    visit root_path

    expect(page).to have_text("blackbelt supermutant")
  end

  xscenario "User clicks the 'No' button" do
    visit root_path

    click_button "No"

    expect(page).to have_text("Widget was successfully created.")
  end
end
