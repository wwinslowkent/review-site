require 'spec_helper'
require 'rails_helper'

feature "add a game" do
  scenario "user needs to log in to adds game from IGDB to our database" do
    visit root_path
    fill_in "Search Games", with: "Mario"
    click_on "Search"
    click_on "Add a Game from IGDB"
    fill_in "Search IGDB Database", with: "Mario"
    click_on "Search"
    click_on "Add Game", match: :first

    expect(page).to have_content('Please sign in to add a game')
  end

  scenario "user adds a game from IGDB to our database" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    fill_in "Search Games", with: "Mario"
    click_on "Search"
    click_on "Add a Game from IGDB"
    fill_in "Search IGDB Database", with: "Mario"
    click_on "Search"
    click_on "Add Game", match: :first

    expect(page).to have_content('Thank you for adding this game to our database!')
    expect(page).to have_content('Super Mario World')
  end
end
