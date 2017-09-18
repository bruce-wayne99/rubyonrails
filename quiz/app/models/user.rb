class User < ApplicationRecord
  has_secure_password
  has_many :leaderboards, dependent: :destroy
  has_many :stats,  dependent: :destroy
  has_many :leaderboards,  dependent: :destroy
  has_many :genres, through: :leaderboards
  has_many :subgenres, through: :leaderboards
end
