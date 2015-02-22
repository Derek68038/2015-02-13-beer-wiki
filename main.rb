require "sinatra"
require "sqlite3"
require "beer_mapping"

DATABASE = SQLite3::Database.new("./database/beer_wiki.db")

require_relative "database/program_methods"
require_relative "helper_module/helper"
require_relative "models/beer"
require_relative "models/style"
require_relative "models/brewery"
require_relative "database/setup"

helpers Helper

get "/" do
  erb :enter
end

get "/home" do
  erb :home
end

get "/not_allowed" do
  erb :not_allowed
end

get "/add_beer" do
  erb :add_beer
end

get "/add_beer_results" do
  @beer = Beer.new(params)
  @beer.insert("beers")
  @style = DATABASE.execute("SELECT style FROM styles WHERE id = #{@beer.style_id}")
  style_id_to_name
  @brewery = DATABASE.execute("SELECT brewery FROM breweries WHERE id = #{@beer.brewery_id}")
  brewery_id_to_name
  erb :add_beer_results
end

get "/add_brewery" do
  erb :add_brewery
end

get "/add_brewery_results" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @brewery = Brewery.new(params)
  erb :add_brewery_results
end

get "/search_beer_name" do
  erb :search_beer_name
end

get "/search_name_results" do
  @beer_name = Beer.fetch_by("beer" => params[:beer])
  erb :search_name_results
end

get "/delete_brewery" do
  erb :delete_brewery
end

get "/delete_brewery_results" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @delete_brewery = Brewery.new(params)
  @brewery = DATABASE.execute("SELECT brewery FROM breweries WHERE id = #{@delete_brewery.brewery}")
  brewery_id_to_name
  erb :delete_brewery_results
end
  
get "/amber" do
  @beer_style = Beer.fetch_by("style_id" => 1)
  erb :amber
end

get "/barleywine" do
  @beer_style = Beer.fetch_by("style_id" => 2)
  erb :barleywine
end

get "/brown" do
  @beer_style = Beer.fetch_by("style_id" => 3)
  erb :brown
end

get "/ipa" do
  @beer_style = Beer.fetch_by("style_id" => 4)
  erb :ipa
end

get "/pale" do
  @beer_style = Beer.fetch_by("style_id" => 5)
  erb :pale
end

get "/stout" do
  @beer_style = Beer.fetch_by("style_id" => 6)
  erb :stout
end

get "/wheat" do
  @beer_style = Beer.fetch_by("style_id" => 7)
  erb :wheat
end

get "/bel_blonde" do
  @beer_style = Beer.fetch_by("style_id" => 8)
  erb :bel_blonde
end

get "/dark_strong" do
  @beer_style = Beer.fetch_by("style_id" => 9)
  erb :dark_strong
end

get "/dubbel" do
  @beer_style = Beer.fetch_by("style_id" => 10)
  erb :dubbel
end

get "/bel_pale" do
  @beer_style = Beer.fetch_by("style_id" => 11)
  erb :bel_pale
end

get "/strong" do
  @beer_style = Beer.fetch_by("style_id" => 12)
  erb :strong
end

get "/tripel" do
  @beer_style = Beer.fetch_by("style_id" => 13)
  erb :tripel
end

get "/blonde" do
  @beer_style = Beer.fetch_by("style_id" => 14)
  erb :blonde
end

get "/pilsner" do
  @beer_style = Beer.fetch_by("style_id" => 15)
  erb :pilsner
end

get "/beaver" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 1)
  erb :beaver
end

get "/kinkaider" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 2)
  erb :kinkaider
end

get "/gottberg" do 
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 3)
  erb :gottberg
end

get "/spilker" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 4)
  erb :spilker
end

get "/thunderhead" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 5)
  erb :thunderhead
end

get "/lucky" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 6)
  erb :lucky
end

get "/blue" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 7)
  erb :blue
end

get "/empyrean" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 8)
  erb :empyrean
end

get "/granite" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 9)
  erb :granite
end

get "/monks" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 10)
  erb :monks
end

get "/ploughshare" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 11)
  erb :ploughshare
end

get "/zipline" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 12)
  erb :zipline
end

get "/loop" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 13)
  erb :loop
end

get "/backswing" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 14)
  erb :backswing
end

get "/benson" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 15)
  erb :benson
end

get "/brickway" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 16)
  erb :brickway
end

get "/farnam" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 17)
  erb :farnam
end

get "/infusion" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 18)
  erb :infusion
end

get "/jaipur" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 19)
  erb :jaipur
end

get "/scriptown" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 20)
  erb :scriptown
end

get "/storz" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 21)
  erb :storz
end

get "/upstream" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 22)
  erb :upstream
end

get "/scratchtown" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 23)
  erb :scratchtown
end

get "/nbc" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 24)
  erb :nbc
end

get "/schilling" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 25)
  erb :schilling
end

get "/soaring" do
  @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  @beer_brewery = Beer.fetch_by("brewery_id" => 26)
  erb :soaring
end
