get "/search_beer_name" do
  erb :"search/search_beer_name"
end

get "/search_name_results" do
  @beer_name = Beer.fetch_by("name" => params[:name])
  erb :"search/search_name_results"
end

get "/list_all_beer" do
  @beer = Beer.show_all_beer_with_brewery_and_style
  erb :"search/list_all_beer"
end

get "/beer_styles" do
  @beer_styles = Style.show_all_styles_or_breweries("styles")
  erb :"search/beer_styles"
end

get "/beer_breweries" do
  @beer_breweries = Brewery.show_all_styles_or_breweries("breweries")
  erb :"search/beer_breweries"
end

get "/style/:style_names" do
  @style_info = Style.find("styles" => params[:style_names])
  @beer_style = Beer.fetch_by("style_id" => params[:style_names])
  erb :"search/styles"
end

get "/brewery/:brewery_names" do
  beer_mapper
  @brewery_info = Brewery.find("breweries" => params[:brewery_names])
  @beer_brewery = Beer.fetch_by("beers_breweries.brewery_id" => params[:brewery_names])
  erb :"search/breweries"
end