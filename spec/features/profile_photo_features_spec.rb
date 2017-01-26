require 'spec_helper'
require 'rails_helper'

feature 'profile photo' do
  scenario 'user uploads a profile photo' do
    visit root_path
    click_link "Sign up"
    fill_in "Name", with: "Snape Granger"
    page.attach_file "Profile photo", "#{Rails.root}/spec/support/images/photo.png"

    fill_in "Email", with: "Severus@snape.com"
    fill_in "Password", with: "HarryPotter"
    fill_in "Password confirmation", with: "HarryPotter"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."

  end
end
