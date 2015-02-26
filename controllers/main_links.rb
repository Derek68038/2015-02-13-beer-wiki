get "/search_beer_name" do
  erb :"main_links/search_beer_name"
end

get "/search_name_results" do
  @beer_name = Beer.fetch_by("beer" => params[:beer])
  erb :"main_links/search_name_results"
end

get "/list_all_beer" do
  @beer = Beer.all("beers")
  erb :"main_links/list_all_beer"
end

get "/style/:style_names" do
  @style_info = Style.find("styles" => params[:style_names])
  @beer_style = Beer.fetch_by("style_id" => params[:style_names])
  erb :"main_links/styles"
end

get "/brewery/:brewery_names" do
  beer_mapper
  @brewery_info = Brewery.find("breweries" => params[:brewery_names])
  @beer_brewery = Beer.fetch_by("brewery_id" => params[:brewery_names])
  erb :"main_links/breweries"
end