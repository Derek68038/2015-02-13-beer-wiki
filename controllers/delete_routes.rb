get "/delete_brewery" do
  erb :"delete/delete_brewery"
end

get "/delete_brewery_results" do
  beer_mapper
  delete_brewery = Brewery.new(params)
  @name = delete_brewery.delete_brewery_id_to_name
  erb :"delete/delete_brewery_results"
end

get "/delete_beer" do
  erb :"delete/delete_beer"
end

post "/delete_beer_results" do
  # @id_name = Beer.find("beers" => params[:id]) # this was used when I had a delete results page.
  Beer.delete("beers" => params[:id])
  redirect "/list_all_beer"
end