class Task < ApplicationRecord

  validates :name, length: { in: 1..30 }

  enum status: { "未着手": 0, "着手中": 1, "完了": 2, }

end
