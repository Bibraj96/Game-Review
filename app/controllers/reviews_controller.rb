class ReviewsController < ApplicationController

  def index
  end

  def new
    @game = Game.find_by_id(params[:game_id])
    @review = @game.reviews.build
  end

  def create
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :game_id)
  end

end
