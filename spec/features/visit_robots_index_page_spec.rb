require 'rails_helper'

feature "visiting the robots index page" do
  background do
    @user = FactoryGirl.create(:user)
  end
  scenario "a unregistered user can visit the robots index page" do
    visit robots_path
    expect(page.html).to include("In Stock")
    expect(page.html).to_not include("On Order")
  end

  scenario "a logged-in user can visit the robots index page" do
    page.set_rack_session(:user_id => @user.id)
    visit robots_path
    expect(page.html).to include("In Stock")
    expect(page.html).to include("On Order")
  end
end
