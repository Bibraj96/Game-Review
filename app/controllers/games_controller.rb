class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @game.build_genre
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = session[:user_id]
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    @game = Game.find_by(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:title, genre_attributes: [:name])
  end

end
