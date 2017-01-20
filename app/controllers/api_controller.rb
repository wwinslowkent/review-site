class ApiController < ApplicationController
  def index
    @games = []
    if params[:search]
      @search = params[:search]
      @client = HTTPClient.new
      @uri = "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=*&limit=20&offset=0"
      @response = @client.get(@uri, :query => {:search => @search }, :header => { :"X-Mashape-Key" => 'TeipM9suCkmshT1wgcmfsmAr5qS5p1Wr5BKjsnn6122WXCp8L8', :"Accept" => 'application/json'}).body
      @parsed = JSON.parse(@response)
      @parsed.each do |body|
        if (body['cover']) && (body['name']) && (body['summary'])
          @games << body
        end
      end
    end
  end
end
