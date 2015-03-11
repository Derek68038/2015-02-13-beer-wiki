get "/delete_brewery" do
  erb :"delete/delete_brewery"
end

get "/delete_brewery_results" do
  beer_mapper     # @beer defined by beer_mapper
  @brewery = Brewery.find(params["place"])
  erb :"delete/delete_brewery_results"
end

get "/delete_beer" do
  erb :"delete/delete_beer"
end

post "/delete_beer_results" do
  Beer.delete(params[:id])         
  redirect "/list_all_beer"
end