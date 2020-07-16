class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :user #creator of a game, not another join table
  has_many :reviews
  has_many :users, through: :reviews #users who have reviewed the games

  validates :title, presence: true

  #accepts_nested_attributes_for :genre 

  def genre_attributes(att)
    genre = Genre.find_or_create_by(att) if
      !att['name'].empty?
  end

end
