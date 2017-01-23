class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :summary, presence: true
  validates :cover_url, presence: true

  has_many :reviews
end
