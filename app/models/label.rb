class Label < ApplicationRecord
  validates :label, length: { maximum: 50 }

  has_many :connects, dependent: :destroy
  has_many :tasks, through: :connects
end
