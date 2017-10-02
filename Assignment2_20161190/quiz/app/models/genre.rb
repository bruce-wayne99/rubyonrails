class Genre < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 5, :maximum => 30
  validates_length_of :description, :minimum => 10, :maximum => 500

  has_many :subgenres, dependent: :destroy
  has_many :leaderboards,  dependent: :destroy
  has_many :users, through: :leaderboards
end
