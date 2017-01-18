require 'spec_helper'
require 'rails_helper'

feature "games navigation" do
  scenario "visitor sees a list of games in the database" do
    game = Game.create(name: 'Pokemon Sun', summary: "Pokémon Sun and Pokémon Moon trademarks were registered thus leaking the next Pokémon game titles to the public. Pokémon.com confirmed the games would be for the Nintendo 3DS and released in holiday 2016, with a new world, new Pokémon, and new adventures.\n\nPokémon Sun and Pokémon Moon will be the first games in the Pokémon series to allow players to choose from nine languages to play in. In addition to English, French, German, Italian, Japanese, Korean, and Spanish, players will now be able to play in both Traditional and Simplified Chinese.", cover_url: "images.igdb.com/igdb/image/upload/t_thumb/aoeuitjpvoky1gqwf7cg.png")
    gameb = Game.create(name: 'Pokemon Moon', summary: "Pokémon Sun and Pokémon Moon trademarks were registered thus leaking the next Pokémon game titles to the public. Pokémon.com confirmed the games would be for the Nintendo 3DS and released in holiday 2016, with a new world, new Pokémon, and new adventures.\n\nPokémon Sun and Pokémon Moon will be the first games in the Pokémon series to allow players to choose from nine languages to play in. In addition to English, French, German, Italian, Japanese, Korean, and Spanish, players will now be able to play in both Traditional and Simplified Chinese.", cover_url: "images.igdb.com/igdb/image/upload/t_thumb/a52al5isjxc6arqghbe0.png")

    visit root_path
    click_link "All Games"

    expect(page).to have_content(game.name)
    expect(page).to have_content(game.summary)
    expect(page).to have_content(gameb.name)
    expect(page).to have_content(gameb.summary)
  end

  scenario "visitor goes to an individual game page" do
    game = Game.create(name: 'Pokemon Sun', summary: "Pokémon Sun trademarks were registered thus leaking the next Pokémon game titles to the public. Pokémon.com confirmed the games would be for the Nintendo 3DS and released in holiday 2016, with a new world, new Pokémon, and new adventures.\n\nPokémon Sun and Pokémon Moon will be the first games in the Pokémon series to allow players to choose from nine languages to play in. In addition to English, French, German, Italian, Japanese, Korean, and Spanish, players will now be able to play in both Traditional and Simplified Chinese.", cover_url: "images.igdb.com/igdb/image/upload/t_thumb/aoeuitjpvoky1gqwf7cg.png")
    gameb = Game.create(name: 'Pokemon Moon', summary: "Pokémon Moon trademarks were registered thus leaking the next Pokémon game titles to the public. Pokémon.com confirmed the games would be for the Nintendo 3DS and released in holiday 2016, with a new world, new Pokémon, and new adventures.\n\nPokémon Sun and Pokémon Moon will be the first games in the Pokémon series to allow players to choose from nine languages to play in. In addition to English, French, German, Italian, Japanese, Korean, and Spanish, players will now be able to play in both Traditional and Simplified Chinese.", cover_url: "images.igdb.com/igdb/image/upload/t_thumb/a52al5isjxc6arqghbe0.png")

    visit root_path
    click_link "All Games"
    click_link game.name

    expect(page).to have_content(game.name)
    expect(page).to have_content(game.summary)
    expect(page).to_not have_content(gameb.name)
    expect(page).to_not have_content(gameb.summary)
  end
end
