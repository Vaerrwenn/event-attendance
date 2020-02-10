class Event < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :start_time, presence: true
    validates :end_time, presence: true, numericality: { greater_than: :start_time}
    validates :location, presence: true
    #validates :attendance_num, numericality: { only_integer: true }
end
