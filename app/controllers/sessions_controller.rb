class SessionsController < ApplicationController
  
  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username]) # better to user find_by b/c you can use a key/value pair/doesn't throw an error
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user),  :flash => { :notice => "Welcome!"}
    else
      flash[:error] = "Unable to log in. Please make sure all fields are filled in correctly!"
      redirect_to login_path
    end
  end

  def omniauth
    @user = User.find_or_create_by_google(auth)

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete(:user_id) # use #delete here, #destroy is mainly used for objects
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end