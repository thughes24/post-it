class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes
  has_secure_password validations: false
  validates :password, presence: true, on: :create
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, on: :create
  validates :username, :email, presence: true, uniqueness: true, on: :create
end