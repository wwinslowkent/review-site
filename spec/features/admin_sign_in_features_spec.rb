require 'spec_helper'
require 'rails_helper'

feature 'admin sign in' do
  scenario 'admin signs in successfully' do
    admin = FactoryGirl.create(:admin)
    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  scenario 'admin email is invalid' do
    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: "h"
    fill_in "Password", with: "HarryPotter"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end

  scenario 'admin password is incorrect' do
    admin = FactoryGirl.create(:admin)
    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: "HarryPooter"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end

end

feature 'admin sign out' do
  scenario 'admin signs out successfully' do
    admin = FactoryGirl.create(:admin)
    admin = FactoryGirl.create(:admin)
    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    click_link 'Logout'

    expect(page).to have_content "Signed out successfully."
  end
end
