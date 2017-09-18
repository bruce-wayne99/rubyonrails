class Subgenre < ApplicationRecord
  belongs_to :genre
  has_many :questions, dependent: :destroy
  has_many :leaderboards,  dependent: :destroy
  has_many :users, through: :leaderboards
end
