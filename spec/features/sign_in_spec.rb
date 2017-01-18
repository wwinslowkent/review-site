require 'spec_helper'
require 'rails_helper'

feature 'sign in' do
  scenario 'user with no email confirmation tries to sign in' do
    visit root_path
    click_link "Sign up"
    fill_in "Name", with: "Hermione Granger"
    fill_in "Email", with: "harry@potter.com"
    fill_in "Password", with: "HarryPotter"
    fill_in "Password confirmation", with: "HarryPotter"
    click_button "Sign up"
    visit root_path
    click_link "Log in"
    fill_in "Email", with: "harry@potter.com"
    fill_in "Password", with: "HarryPotter"
    click_button "Log in"
    expect(page).to have_content "You have to confirm your email address before continuing."
  end


end
