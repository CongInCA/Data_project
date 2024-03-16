class TransitPerformance < ApplicationRecord
    belongs_to :driver
    belongs_to :day_type
    validates :stop_number, :route_number, :route_name, :route_destination, :scheduled_time, :deviation, presence: true
    validates :driver_id, inclusion: { in: 1..100 }
end
