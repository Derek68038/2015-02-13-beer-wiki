get "/search_beer_name" do
  erb :"search/search_beer_name"
end

get "/search_name_results" do
  @beer_name = Beer.where("name = '#{params[:name]}'")      
  erb :"search/search_name_results"
end

get "/list_all_beer" do
  @beer = Beer.all  
  erb :"search/list_all_beer"
end

get "/beer_styles" do
  @beer_styles = Style.all  
  erb :"search/beer_styles"
end

get "/beer_breweries" do
  @beer_breweries = Brewery.all  
  erb :"search/beer_breweries"
end

get "/style/:style_id" do
  @style_info = Style.find(params[:style_id])    
  @beer_style = Beer.where("style_id = #{params[:style_id]}")   
  erb :"search/styles"
end

get "/brewery/:brewery_id" do
  beer_mapper
  @brewery_info = Brewery.find(params[:brewery_id])       
  @beer_brewery = @brewery_info.beers
  erb :"search/breweries"
end