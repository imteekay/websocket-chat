class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :messages
  has_many :conversations, through: :messages

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
end
