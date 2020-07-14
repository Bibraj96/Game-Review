class GamesController < ApplicationController

  def new
    @game = Game.new
    @game.build_genre
  end

  private

  def game_params
    params.require(:game).permit(:title, :genre_attributes [:name])
  end

end
