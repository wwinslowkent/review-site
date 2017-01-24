require 'spec_helper'
require 'rails_helper'

feature "admin controls gamerequests" do
  scenario "admin deletes a gamerequest" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    gr = FactoryGirl.create(:gamerequest, user: user)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    click_on "Dashboard"
    click_on "Game Request List", match: :first

    expect(page).to have_content(gr.name)

    click_on "Delete Request", match: :first

    expect(page).to have_content('You have deleted this request successfully')
  end

  scenario "admin edits a gamerequest" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    gr = FactoryGirl.create(:gamerequest, user: user)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    click_on "Dashboard"
    click_on "Game Request List", match: :first

    click_on "Edit", match: :first
    fill_in "Name", with: 'This is edited content'
    click_on "Submit"

    expect(page).to have_content('Thank you for editing this request')
    expect(page).to have_content('This is edited content')
  end

  scenario "admin approves a gamerequest" do
    admin = FactoryGirl.create(:admin)
    user = FactoryGirl.create(:user)
    gr = FactoryGirl.create(:gamerequest, user: user)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    click_on "Dashboard"
    click_on "Game Request List", match: :first

    click_on "Approve Game", match: :first

    expect(page).to have_content('Thank you for adding this game to our database')
    expect(page).to have_content(gr.name)
    expect(page).to have_content(gr.summary)
  end
end
