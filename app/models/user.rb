class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, uniqueness: { message: "that username is already in use" }
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :validatable

  def confirmation_required?
    !confirmed?
  end
end
