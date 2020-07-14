class SessionsController < ApplicationController
  
  def welcome
  end

  def destroy
    session.delete(:user_id) # #destroy is mainly used for objects
    redirect_to '/'
  end

end