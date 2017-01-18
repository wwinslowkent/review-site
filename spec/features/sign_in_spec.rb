require 'spec_helper'
require 'rails_helper'

feature 'sign in' do
  scenario 'user signs in successfully' do
    FactoryGirl.create(:user)
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "harry@potter.com"
    fill_in "Password", with: "HarryPotter"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end
  scenario 'user email is invalid' do
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "h"
    fill_in "Password", with: "HarryPotter"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end
  scenario 'user password is incorrect' do
    FactoryGirl.create(:user)
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "harry@potter.com"
    fill_in "Password", with: "HarryPooter"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end


end
