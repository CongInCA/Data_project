class CreateTransitPerformances < ActiveRecord::Migration[7.1]
  def change
    create_table :transit_performances do |t|
      t.integer :driver_id
      t.integer :day_id
      t.string :stop_number
      t.string :route_number
      t.string :route_name
      t.string :route_destination
      t.datetime :scheduled_time
      t.integer :deviation

      t.timestamps
    end
  end
end
