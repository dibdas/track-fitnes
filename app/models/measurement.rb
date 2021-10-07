class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  validates :measure, presence: true
  scope :from_current_user, ->(current_user) { includes(:exercise, :user).where(user_id: current_user) }
end
