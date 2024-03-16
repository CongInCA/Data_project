class Driver < ApplicationRecord
    has_many :transit_performances
    validates :name, :license_number, presence: true
    validates :age, inclusion: { in: 20..60 }
end
