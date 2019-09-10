class Task < ApplicationRecord

  validates :name, length: { in: 1..150 }

end
