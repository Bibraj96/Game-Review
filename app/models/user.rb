class User < ApplicationRecord
  has_many :reviews
  has_many :games, through: :reviews

  has_many :games #these are games that the user created; gives us @user.games
end
