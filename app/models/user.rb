class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, uniqueness: { message: "that username is already in use" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
end
