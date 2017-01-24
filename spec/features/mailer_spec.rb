require 'spec_helper'
require 'rails_helper'

feature 'mailers' do
  scenario "delete a game request" do
    user = FactoryGirl.create(:user)
    gr = FactoryGirl.create(:gamerequest, user: user)
    admin = FactoryGirl.create(:admin)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    click_on "Dashboard"
    click_on "Game Request List", match: :first

    expect(page).to have_content(gr.name)

    click_on "Delete Request", match: :first


    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "approve a game request" do
    user = FactoryGirl.create(:user)
    gr = FactoryGirl.create(:gamerequest, user: user)
    admin = FactoryGirl.create(:admin)

    visit root_path
    click_link "Login Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    click_on "Dashboard"
    click_on "Game Request List", match: :first

    expect(page).to have_content(gr.name)

    click_on "Approve Game", match: :first


    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
