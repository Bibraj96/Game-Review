class ReviewsController < ApplicationController

  def index
    #if it's nested and the id is valid
    if @game = Game.find_by_id(params[:game_id])
      @reviews = @game.reviews
    else
      @reviews = Review.all
    end
  end

  def new
    if @game = Game.find_by_id(params[:game_id])
      @review = @game.reviews.build
    else
      @review = Review.new
    end
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

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    @review.destroy
    redirect_to user_path(@review.user)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :game_id)
  end

end
