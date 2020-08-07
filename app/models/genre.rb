class Genre < ApplicationRecord
  has_many :games

  validates :name, presence: true, uniqueness: true

  def self.order_alph
    order(:name)
  end
end
