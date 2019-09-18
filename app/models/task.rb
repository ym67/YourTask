class Task < ApplicationRecord

  validates :name, length: { in: 1..30 }

  enum status: { untouched: 0, in_progress: 1, done: 2, }

  scope :sorted, -> { order(created_at: :desc) }

end
