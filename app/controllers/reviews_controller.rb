class ReviewsController < ApplicationController

  before_action :find_review, only:[:show, :edit, :update, :destroy]
  before_action :not_logged_in?
  
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
      redirect_to review_path(@review), :flash => { :notice => "Your review was created!"}
    else
      render :new
    end
  end

  def show
    if @review = Review.find_by_id(params[:id])
    else
      redirect_to reviews_path, :flash => { :alert => "That review doesn't exist!"}
    end
  end

  def edit 
    if current_user.id == @review.user_id
    else 
      redirect_to reviews_path,  :flash => { :alert => "You can only edit your own reviews!"}
    end
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review), :flash => { :notice => "Your review was edited!"}
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(@review.user), :flash => { :notice => "Your review was deleted!"}
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :game_id)
  end

  def find_review
    @review = Review.find_by_id(params[:id])
  end
end
