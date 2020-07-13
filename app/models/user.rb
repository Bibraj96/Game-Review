class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_games, through: :reviews, source: :game #see odinproject site for how to use source in models
  has_many :games #these are games that the user created; gives us @user.games

  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  #has_secure_password validates our password 
end
