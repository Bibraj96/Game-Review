class ReviewsController < ApplicationController

  def index
  end

  def new
    @game = Game.find_by_id(params[:game_id])
    @review = @game.reviews.build
  end

end
