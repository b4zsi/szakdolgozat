class CalendarEvent < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10, maximum: 50 }
  validates :startDate, presence: true
  validates :endDate, presence: true
end
