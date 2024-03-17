# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Import data from API
require 'uri'
require 'net/http'
require 'json'
require 'csv'

uri = URI('https://data.winnipeg.ca/resource/gp3k-am4u.json')
response = Net::HTTP.get(uri)
transit_data = JSON.parse(response)

transit_data.each do |data|
    day_type = data['day_type']
    day = DayType.find_or_create_by(day_type: day_type)
    driver_id = rand(1..300)

    TransitPerformance.create(
    driver_id: driver_id,
    day_id: day.id,
    stop_number: data['stop_number'],
    route_number: data['route_number'],
    route_name: data['route_name'],
    route_destination: data['route_destination'],
    scheduled_time: DateTime.parse(data['scheduled_time']),
    deviation: data['deviation']
  )
end

# Import data from faker
300.times do
    Driver.create(
      name: Faker::Name.name,
      age: Faker::Number.between(from: 20, to: 60),
      license_number: Faker::IDNumber.unique.valid
    )
  end

# Import data from CSV
CSV.foreach('/Users/captainchenn/Desktop/3011 ruby/Data_project/Data_project/days.csv', headers: true) do |row|
DayType.create(day_id: row['day_id'], day_type: row['day_type'])
end
