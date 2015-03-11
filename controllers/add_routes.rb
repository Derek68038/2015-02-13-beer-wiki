get "/add_beer" do
  erb :"add/add_beer"
end

post "/add_beer_results" do
  @beer = Beer.new(params)
  @beer.save
  redirect "/list_all_beer"
end

get "/add_brewery" do
  erb :"add/add_brewery"
end

get "/add_brewery_results" do
  beer_mapper
  @brewery = Brewery.new(params)
  erb :"add/add_brewery_results"
end