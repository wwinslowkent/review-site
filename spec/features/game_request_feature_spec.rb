require 'spec_helper'
require 'rails_helper'

feature 'adds a new game' do
  scenario 'visitor requests a new game to be added' do
    visit root_path
    fill_in "Search Games", with: "Who's Your Daddy? 2"
    click_on "Search"
    click_on "Add a Game from IGDB"
    fill_in "Search IGDB Database", with: "Who's Your Daddy? 2"
    click_on "Search"
    click_on "Request a Game"

    expect(page).to have_content('Please sign in to request a game')
  end

  scenario 'user requests a new game to be added correctly' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    fill_in "Search Games", with: "Who's Your Daddy?"
    click_on "Search"
    click_on "Add a Game from IGDB"
    fill_in "Search IGDB Database", with: "Who's Your Daddy?"
    click_on "Search"
    click_on "Request a Game"
    fill_in "Name", with: "Who's Your Daddy"
    fill_in "Summary", with: "Baby tries to kill itself while the daddy tries to save it from itself"
    fill_in "Cover url", with: "https://i.ytimg.com/vi/LRcI4KTbBdg/maxresdefault.jpg"
    click_on "Submit"

    expect(page).to have_content('Request Created Successfully.')
  end

  scenario 'user requests a new game to be added incorrectly' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    fill_in "Search Games", with: "Who's Your Daddy?"
    click_on "Search"
    click_on "Add a Game from IGDB"
    fill_in "Search IGDB Database", with: "Who's Your Daddy?"
    click_on "Search"
    click_on "Request a Game"

    click_on "Submit"

    expect(page).to have_content("Name can't be blank, Summary can't be blank, Summary must be at least 20 characters, and Cover url can't be blank")
  end
end
