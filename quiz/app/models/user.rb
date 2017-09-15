class User < ApplicationRecord
  has_secure_password
  has_many :leaderboards
  has_many :stats
end
