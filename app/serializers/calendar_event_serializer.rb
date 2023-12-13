class CalendarEventSerializer < ActiveModel::Serializer
    attributes :id, :title, :startDate, :endDate, :color
end
