class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :user #creator of a game, not another join table
  has_many :reviews
  has_many :users, through: :reviews #users who have reviewed the games
end
