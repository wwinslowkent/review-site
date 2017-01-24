class Admin < ApplicationRecord
  devise :database_authenticatable, :timeoutable

  validates :email, presence: true, uniqueness: true
end
