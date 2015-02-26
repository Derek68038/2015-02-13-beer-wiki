get "/" do
  erb :"main_pages/enter"
end

get "/home" do
  @beer_styles = Style.all("styles")
  @beer_breweries = Brewery.all("breweries")
  erb :"main_pages/home"
end

get "/not_allowed" do
  erb :"main_pages/not_allowed"
end