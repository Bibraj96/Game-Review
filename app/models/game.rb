class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :user #creator of a game, not another join table
  has_many :reviews
  has_many :users, through: :reviews #users who have reviewed the games

  validates :title, presence: true
  validates :title, uniqueness: true

  #accepts_nested_attributes_for :genre 

  def genre_attributes=(attributes)
    self.genre = Genre.find_or_create_by(attributes) if !attributes['name'].empty?
    self.genre
  end

  def self.order_alph
    order(:title)
  end

end
