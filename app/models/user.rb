class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_games, through: :reviews, source: :game

  has_many :games #these are games that the user created; gives us @user.games
end
