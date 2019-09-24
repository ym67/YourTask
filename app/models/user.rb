class User < ApplicationRecord

  validates :name,
    length: { in: 1..50 }

  validates :email,
    length: { in: 1..255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true

  has_secure_password
  validates :password,
    length: { minimum: 6 }, allow_nil: true

  has_many :tasks, dependent: :destroy

  scope :sorted, -> { order(created_at: :desc) }

  paginates_per 10

end
