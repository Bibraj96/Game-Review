class ReviewsController < ApplicationController

  def index
  end

  def new
    @game = Game.find_by_id(params[:game_id])
    @review = @game.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :game_id)
  end

end
