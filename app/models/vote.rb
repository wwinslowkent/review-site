class Vote < ApplicationRecord
  belongs_to :review
  validates :vote, presence: true, numericality: true, numericality: { greater_than_or_equal_to: -1, less_than_or_equal_to: 1, message: "must be between -1 and 1" }
end
