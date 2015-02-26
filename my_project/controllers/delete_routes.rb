get "/delete_brewery" do
  erb :"delete_routes/delete_brewery"
end

get "/delete_brewery_results" do
  beer_mapper
  delete_brewery = Brewery.new(params)
  @name = delete_brewery.delete_brewery_id_to_name
  erb :"delete_routes/delete_brewery_results"
end

get "/delete_beer" do
  erb :"delete_routes/delete_beer"
end

post "/delete_beer_results" do
  @id_name = Beer.find("beers" => params[:id])
  @id_name.style_id_to_name
  @id_name.brewery_id_to_name
  Beer.delete("beers" => params[:id])
  erb :"delete_routes/delete_beer_results"
end