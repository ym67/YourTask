class User < ApplicationRecord

  validates :name,
    presence: true,
    length: { in: 1..50 }

  validates :email,
    presence: true,
    length: { in: 1..255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true

  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 6 }

end
