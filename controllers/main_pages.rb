get "/" do
  erb :"homepages/enter"
end

post "/verify" do
  @user = User.find_by_user(params[:user])
  if @user == nil
    @user = User.new(user: "#{params[:user]}", password: BCrypt::Password.create(params[:password]))
    if params[:password] == ""
      redirect "/not_allowed"
    elsif @user.save
      session[:user_id] = @user.id
      redirect "/home"
    else
      erb :"homepages/enter"
    end
  else
    crypt_password = BCrypt::Password.new(@user.password)
    if crypt_password == params[:password]
      session[:user_id] = @user.id
      redirect "/home"
    else 
      redirect "/not_allowed"
    end
  end
end

get "/home" do
  user = User.find_by_id(session[:user_id])
  @name = user.user
  erb :"homepages/home"
end

get "/not_allowed" do
  erb :"homepages/not_allowed"
end