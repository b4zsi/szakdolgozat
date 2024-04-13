class CalendarEvent < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10, maximum: 50 }
  validates :startDate, presence: true
  validates :endDate, presence: true
  validates :color, presence: true, length: { minimum: 7, maximum: 7 }, :default => "#000000"
end
