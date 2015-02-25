#require 'pry'
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
  @beer_styles = Style.all("styles")
  @beer_breweries = Brewery.all("breweries")
  erb :home
end

get "/not_allowed" do
  erb :not_allowed
end

get "/add_beer" do
  erb :add_beer
end

post "/add_beer_results" do
  @beer = Beer.new(params)
  @beer.insert("beers")
  @beer.style_id_to_name
  @beer.brewery_id_to_name
  erb :add_beer_results
end

get "/search_beer_name" do
  erb :search_beer_name
end

get "/search_name_results" do
  @beer_name = Beer.fetch_by("beer" => params[:beer])
  erb :search_name_results
end

get "/list_all_beer" do
  @beer = Beer.all("beers")
  erb :list_all_beer
end

get "/add_brewery" do
  erb :add_brewery
end

get "/add_brewery_results" do
  beer_mapper
  @brewery = Brewery.new(params)
  erb :add_brewery_results
end

get "/delete_brewery" do
  erb :delete_brewery
end

get "/delete_brewery_results" do
  beer_mapper
  delete_brewery = Brewery.new(params)
  @name = delete_brewery.delete_brewery_id_to_name
  erb :delete_brewery_results
end

get "/delete_beer" do
  erb :delete_beer
end

post "/delete_beer_results" do
  @id_name = Beer.find("beers" => params[:id])
  @id_name.style_id_to_name
  @id_name.brewery_id_to_name
  Beer.delete("beers" => params[:id])
  erb :delete_beer_results
end
  
get "/style/:style_names" do
  @style_info = Style.find("styles" => params[:style_names])
  @beer_style = Beer.fetch_by("style_id" => params[:style_names])
  erb :styles
end

get "/brewery/:brewery_names" do
  beer_mapper
  @brewery_info = Brewery.find("breweries" => params[:brewery_names])
  @beer_brewery = Beer.fetch_by("brewery_id" => params[:brewery_names])
  erb :breweries
end



