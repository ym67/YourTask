class User < ApplicationRecord

  validates :name,
    length: { in: 1..50 }

  validates :email,
    length: { in: 1..255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true

  has_secure_password
  validates :password,
    length: { minimum: 6 }

  has_many :tasks
end
