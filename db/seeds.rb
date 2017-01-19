# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @games = []
# @search = 'zelda'
# @client = HTTPClient.new
# @uri = "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=*&limit=50&offset=0"
# @response = @client.get(@uri, :query => {:search => @search }, :header => { :"X-Mashape-Key" => 'TeipM9suCkmshT1wgcmfsmAr5qS5p1Wr5BKjsnn6122WXCp8L8', :"Accept" => 'application/json'}).body
# @parsed = JSON.parse(@response)
# @parsed.each do |body|
#   if (body['cover']) && (body['name']) && (body['summary'])
#     @games << body
#   end
# end
#
# @games.each do |game|
#   Game.create(name: game['name'], summary: game['summary'], cover_url: game['cover']['url'])
# end
