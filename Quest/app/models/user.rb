class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true, length:{minimum:8}

  has_many :questions
end
