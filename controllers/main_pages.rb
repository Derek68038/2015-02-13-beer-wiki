get "/" do
  erb :"homepages/enter"
end

post "/verify" do
  @user = User.find_by_user(params[:user])
  if @user == nil
    @user = User.create(user: "#{params[:user]}", password: BCrypt::Password.create(params[:password]))
  end
  
  crypt_password = BCrypt::Password.new(@user.password)

  if crypt_password == params[:password]
    session[:user_id] = @user.id
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