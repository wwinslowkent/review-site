require 'spec_helper'
require 'rails_helper'

feature "search bar" do
  scenario "vistor looks for a game in our database" do
    game = FactoryGirl.create(:game)

    visit root_path
    fill_in "Search Games", with: "Pokemon"
    click_on "Search"

    expect(page).to have_content(game.name)
    expect(page).to have_content(game.summary)

  end

  scenario "vistor looks for a game we don't have in our database" do
    game = FactoryGirl.create(:game)

    visit root_path
    fill_in "Search Games", with: "Mario"
    click_on "Search"

    expect(page).to have_content("There are no games containing the term Mario.")
    expect(page).to_not have_content(game.name)
  end

  context "displays all the games in the database if the search bar is empty" do
    scenario "vistor leaves search bar empty" do
      game = FactoryGirl.create(:game)

      visit root_path
      click_on "Search"

      expect(page).to have_content(game.name)
      expect(page).to have_content(game.summary)
    end
  end
end
