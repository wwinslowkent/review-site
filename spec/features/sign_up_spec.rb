require 'spec_helper'
require 'rails_helper'

feature 'sign up' do
  scenario 'valid user signs up' do
    visit root_path
    click_link "Sign up"
    fill_in "Name", with: "Hermione Granger"
    fill_in "Email", with: "harry@potter.com"
    fill_in "Password", with: "HarryPotter"
    fill_in "Password confirmation", with: "HarryPotter"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link "Sign up"
    fill_in "Name", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: "HarryPotter"
    fill_in "Password confirmation", with: "HarryPotter"
    click_button "Sign up"
    expect(page).to have_content "Email can't be blank"


  end

  scenario 'passwords do not match' do
    visit root_path
    click_link "Sign up"
    fill_in "Name", with: "Hermione Granger"
    fill_in "Email", with: "harry@potter.com"
    fill_in "Password", with: "HarryPotter"
    fill_in "Password confirmation", with: "HairyPotter"
    click_button "Sign up"
    expect(page).to have_content "Password confirmation doesn't match Password"


  end
end
