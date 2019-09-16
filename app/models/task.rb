class Task < ApplicationRecord

  validates :name, length: { in: 1..30 }

end
