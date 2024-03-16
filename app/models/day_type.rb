class DayType < ApplicationRecord
    has_many :transit_performances
    validates :day_type, presence: true
end
