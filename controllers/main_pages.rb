get "/" do
  erb :"homepages/enter"
end

post "/verify" do
  @user = User.find_by_user(params[:user])
  if @user == nil
    @user = User.create(user: "#{params[:user]}", password: "#{params[:password]}")
  end
  my_password = BCrypt::Password.create(params[:password])
  if my_password == @user.password
    redirect "/home"
  else 
    redirect "/not_allowed" 
  end
end

get "/home" do
  erb :"homepages/home"
end

get "/not_allowed" do
  erb :"homepages/not_allowed"
end