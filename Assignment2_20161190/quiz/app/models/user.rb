class User < ApplicationRecord

  has_secure_password
  validates :username, presence: true
  validates :email, presence: true
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :username, :minimum => 5, :maximum => 30


  has_many :leaderboards, dependent: :destroy
  has_many :stats,  dependent: :destroy
  has_many :leaderboards,  dependent: :destroy
  has_many :genres, through: :leaderboards
  has_many :subgenres, through: :leaderboards
end
