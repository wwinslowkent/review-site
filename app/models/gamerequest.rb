class Gamerequest < ApplicationRecord
  validates :name, presence: true
  validates :summary, presence: true, length: { minimum: 20, message: 'must be at least 20 characters' }
  validates :cover_url, presence: true
  belongs_to :user
end
