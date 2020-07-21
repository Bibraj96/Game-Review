class GenresController < ApplicationController

  before_action :not_logged_in?

  def index
    @genres = Genre.all
  end
  
end
