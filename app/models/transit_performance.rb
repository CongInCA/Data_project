class TransitPerformance < ApplicationRecord
    include Kaminari::PageScopeMethods

    belongs_to :driver,optional: true
    belongs_to :day_type,optional: true
    validates :stop_number, :route_number, :route_name, :route_destination, :scheduled_time, :deviation, presence: true
    validates :driver_id, inclusion: { in: 1..300 }

    # def self.search(query)
    #     if query.present?
    #       where("route_number LIKE ?","%#{query}%")
    #     else
    #       all
    #     end
    #   end
end