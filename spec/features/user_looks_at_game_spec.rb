require 'spec_helper'
require 'rails_helper'

feature "games navigation" do
  scenario "visitor goes to an individual game page" do
    game = FactoryGirl.create(:game)
    gameb = FactoryGirl.create(:game, name: "Pokemon Mun", summary: 'Test')

    visit root_path
    click_on "Search"
    click_link game.name

    expect(page).to have_content(game.name)
    expect(page).to have_content(game.summary)
    expect(page).to_not have_content(gameb.name)
    expect(page).to_not have_content(gameb.summary)
  end
end
