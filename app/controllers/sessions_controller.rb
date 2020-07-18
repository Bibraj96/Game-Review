class SessionsController < ApplicationController
  
  def welcome
  end

  def new
  end

  def create
    # does the user exist in the database?
    @user = User.find_by(username: params[:user][:username]) # better to user find_by b/c you can use a key/value pair and doesn't throw an error
    # was a user found? did they use the right password?
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id # store their id into the session key (log them in)
      redirect_to user_path(@user)
    else
      flash[:error] = "Incorrect login credentials. Please try again!"
      redirect_to login_path
    end
  end

  def omniauth
    byebug
  end

  def destroy
    session.delete(:user_id) # #destroy is mainly used for objects
    redirect_to '/'
  end

end