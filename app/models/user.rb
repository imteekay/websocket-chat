class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :messages

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
end
