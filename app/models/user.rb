class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_games, through: :reviews, source: :game #see odinproject site for how to use source in models
  has_many :games #these are games that the user created; gives us @user.games

  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  #has_secure_password validates our password 

  def self.find_or_create_by_google(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u| #OR: User.where(email: auth[:info][:email]).first_or_initialize
      u.email = auth[:info][:email]
      u.password = SecureRandom.hex #creates a random password
    end
  end

end
