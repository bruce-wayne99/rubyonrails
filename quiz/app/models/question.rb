class Question < ApplicationRecord
  belongs_to :subgenre
  has_many :options, dependent: :destroy
end
