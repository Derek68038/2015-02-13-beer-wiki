get "/add_beer" do
  erb :"add/add_beer"
end

post "/add_beer_results" do
  @beer = Beer.new(params)
  @beer.save
  redirect "/list_all_beer"
end

get "/add_style" do
  erb :"add/add_style"
end

post "/add_style_results" do
  @style = Style.new(params)
  @style.save
  redirect "/beer_styles"
end

get "add_brewery" do
  erb :"add/add_brewery"
end
  
post "/add_brewery_results" do
  @brewery = Brewery.new(params)
  @brewery.save
  redirect "/beer_breweries"
end

# get "/add_brewery_results" do
#   beer_mapper
#   @brewery = Brewery.new(params)
#   erb :"add/add_brewery_results"
# end