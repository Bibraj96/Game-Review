class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.name(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
      render :new
    end
  end

end
