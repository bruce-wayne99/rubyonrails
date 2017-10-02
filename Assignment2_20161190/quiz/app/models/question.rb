class Question < ApplicationRecord

  validates :qtype, presence: true
  validates :qstring, presence: true
  validates :score, presence: true

  belongs_to :subgenre
  has_many :options, dependent: :destroy
end
