require 'spec_helper'
require 'rails_helper'

feature 'sign in' do
  scenario 'user signs in successfully' do
    user = FactoryGirl.create(:user, email: "snape@slytherin.com")
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "snape@slytherin.com"
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
    FactoryGirl.create(:user, email: "10points@togryffindor.com")
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "10points@togryffindor.com"
    fill_in "Password", with: "HarryPooter"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end


end
