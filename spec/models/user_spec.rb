require 'rails_helper'

feature 'visitor can sign up' do
  scenario 'user signs up' do
    visit new_user_registration_path
    fill_in "Name", with: "Hermione Granger"
    fill_in "Email", with: "harry@potter.com"
    fill_in "Password", with: "HarryPotter"
    fill_in "Password confirmation", with: "HarryPotter"
    click_button "Sign up"
    expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
  end
end
