class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates :measure, presence: true
end
