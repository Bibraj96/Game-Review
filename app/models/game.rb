class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :user #owner of a game, not another join table
end
