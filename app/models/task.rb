class Task < ApplicationRecord
  validates :name, :started_at, :ended_at, presence: true
end
