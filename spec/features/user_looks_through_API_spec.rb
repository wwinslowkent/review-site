require 'spec_helper'
require 'rails_helper'

feature "user can search through the API" do
  scenario "user searches for game" do
    visit root_path
    fill_in "Search Games", with: "Mario"
    click_on "Search"
    click_on "Add a Game from IGDB"
    fill_in "Search IGDB Database", with: "Mario"
    click_on "Search"

    expect(page).to have_content("Super Mario World")
  end
end
