class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_games, through: :reviews, source: :game #see odinproject site for how to use source in models

  has_many :games #these are games that the user created; gives us @user.games
end
