get "/add_beer" do
  erb :"add_routes/add_beer"
end

post "/add_beer_results" do
  @beer = Beer.new(params)
  @beer.insert("beers")
  @beer.style_id_to_name
  @beer.brewery_id_to_name
  erb :"add_routes/add_beer_results"
end

get "/add_brewery" do
  erb :"add_routes/add_brewery"
end

get "/add_brewery_results" do
  beer_mapper
  @brewery = Brewery.new(params)
  erb :"add_routes/add_brewery_results"
end