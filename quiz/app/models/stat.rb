class Stat < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :question
end
