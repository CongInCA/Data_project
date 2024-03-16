class DayType < ApplicationRecord
    has_many :transit_performances,foreign_key: 'day_id'
    validates :day_type, presence: true
end
