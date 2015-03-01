get "/" do
  erb :"homepages/enter"
end

get "/home" do
  erb :"homepages/home"
end

get "/not_allowed" do
  erb :"homepages/not_allowed"
end