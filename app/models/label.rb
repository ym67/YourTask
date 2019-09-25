class Label < ApplicationRecord
  validates :label,
    length: { maximum: 50 }

  belongs_to :task
  has_many :connects, dependent: :destroy
  has_many :connect_tasks, through: :connects, source: :task
end
