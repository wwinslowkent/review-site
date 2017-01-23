class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: { message: 'not unique: This game is already in our database'}
  validates :summary, presence: true
  validates :cover_url, presence: true

  has_many :reviews
end
