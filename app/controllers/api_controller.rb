class ApiController < ApplicationController
  def index
    @games = []
    if params[:search]
      @search = params[:search]
      @client = HTTPClient.new
      @uri = "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=*&limit=20&offset=0"
      @key = ENV['XMASHAPE_KEY']
      @response = @client.get(@uri, :query => {:search => @search }, :header => { :"X-Mashape-Key" => @key, :"Accept" => 'application/json'}).body
      @parsed = JSON.parse(@response)
      @parsed.each do |body|
        if (body['cover']) && (body['name']) && (body['summary'])
          @games << body
        end
      end
    end
    @game = Game.new
  end
end
