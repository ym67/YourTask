class Task < ApplicationRecord
  validates :name, length: { in: 1..30 }

  enum status: { untouched: 0, in_progress: 1, done: 2, }
  enum priority: { high: 0, middle: 1, low: 2, }

  scope :sorted, -> { order(created_at: :desc) }

  paginates_per 10

  belongs_to :user
  has_many :connects, dependent: :destroy
  has_many :connect_labels, through: :connects, source: :label
  accepts_nested_attributes_for :connects, allow_destroy: true
end
