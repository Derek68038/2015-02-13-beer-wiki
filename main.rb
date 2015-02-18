require "sinatra"
require "sqlite3"

DATABASE = SQLite3::Database.new("./database/beer_wiki.db")

require_relative "database/program_methods"
require_relative "models/beer"
require_relative "models/style"
require_relative "models/brewery"
require_relative "database/setup"

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

get "/beer_confirm" do
  @beer = Beer.new(params)
  @beer.insert("beers") 
  erb :beer_confirm
end

get "/amber" do
  erb :amber
end

get "/barleywine" do
  erb :barleywine
end

get "/brown" do
  erb :brown
end

get "/ipa" do
  erb :ipa
end

get "/pale" do
  erb :pale
end

get "/stout" do
  erb :stout
end

get "/wheat" do
  erb :wheat
end

get "/bel_blonde" do
  erb :bel_blonde
end

get "/dark_strong" do
  erb :dark_strong
end

get "/dubbel" do
  erb :dubbel
end

get "/bel_pale" do
  erb :bel_pale
end

get "/strong" do
  erb :strong
end

get "/tripel" do
  erb :tripel
end

get "/blonde" do
  erb :blonde
end

get "/pilsner" do
  erb :pilsner
end

get "/beaver" do
  erb :beaver
end

get "/kinkaider" do
  erb :kinkaider
end

get "/gottberg" do
  erb :gottberg
end

get "/spilker" do
  erb :spilker
end

get "/thunderhead" do
  erb :thunderhead
end

get "/lucky" do
  erb :lucky
end

get "/blue" do
  erb :blue
end

get "/empyrean" do
  erb :empyrean
end

get "/granite" do
  erb :granite
end

get "/monks" do
  erb :monks
end

get "/ploughshare" do
  erb :ploughshare
end

get "/zipline" do
  erb :zipline
end

get "/loop" do
  erb :loop
end

get "/backswing" do
  erb :backswing
end

get "/benson" do
  erb :benson
end

get "/brickway" do
  erb :brickway
end

get "/farnam" do
  erb :farnam
end

get "/infusion" do
  erb :infusion
end

get "/jaipur" do
  erb :jaipur
end

get "/scriptown" do
  erb :scriptown
end

get "/storz" do
  erb :storz
end

get "/upstream" do
  erb :upstream
end

get "/scratchtown" do
  erb :scratchtown
end

get "/nbc" do
  erb :nbc
end

get "/schilling" do
  erb :schilling
end

get "/soaring" do
  erb :soaring
end