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
require 'net/http'
require 'json'

uri = URI('https://data.winnipeg.ca/resource/gp3k-am4u.json')
response = Net::HTTP.get(uri)
transit_data = JSON.parse(response)

transit_data.each do |data|
    day_type = data['day_type']
    day = DayType.find_or_create_by(day: day_type)

  TransitPerformance.create(
    driver_id: Faker::Number.unique.between(from: 1, to: 10),
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
10.times do
    Driver.create(
      name: Faker::Name.name,
      license_number: Faker::IDNumber.unique.valid
    )
  end
  
# Import data from CSV
require 'csv'

CSV.foreach('path/to/day_types.csv', headers: true) do |row|
DayType.create(day_id: row['day_id'], day: row['day'])
end