require "rails_helper"

RSpec.feature 'UnwelcomeController', :type => :feature do
  scenario "User visits the unwelcome page" do
    visit root_path

    expect(page).to have_text("blackbelt supermutant")
  end

  scenario "User clicks the 'No' button" do
    visit root_path
    click_link "No"
    expect(page).to have_css("#login-button")
  end
end
