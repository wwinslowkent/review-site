class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "must be between 1 and 5" }

end
