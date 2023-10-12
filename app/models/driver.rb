class Driver < ApplicationRecord
    has_one :car, class_name: "Car", foreign_key: "driver_id"
    belongs_to :series
end
