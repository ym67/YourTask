class User < ApplicationRecord
  before_destroy :last_admin_user?

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

  private

  def last_admin_user?
    if User.where(admin: true).length <= 1 && self.admin == true
      throw :abort
    end
  end
end
