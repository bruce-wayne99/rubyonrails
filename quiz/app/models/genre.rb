class Genre < ApplicationRecord
  has_many :subgenres, dependent: :destroy
  has_many :leaderboards,  dependent: :destroy
  has_many :users, through: :leaderboards
end
