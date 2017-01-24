FactoryGirl.define do
  factory :gamerequest do
    sequence(:name) { |n| "Pokemon Sun #{n}" }
    summary "Pokémon Sun and Pokémon Moon trademarks were registered thus leaking the next Pokémon game titles to the public. Pokémon.com confirmed the games would be for the Nintendo 3DS and released in holiday 2016, with a new world, new Pokémon, and new adventures. Pokémon Sun and Pokémon Moon will be the first games in the Pokémon series to allow players to choose from nine languages to play in. In addition to English, French, German, Italian, Japanese, Korean, and Spanish, players will now be able to play in both Traditional and Simplified Chinese."
    cover_url "images.igdb.com/igdb/image/upload/t_thumb/aoeuitjpvoky1gqwf7cg.png"
  end
end
