class AddLongitudeAndLatitudeToTransitPerformances < ActiveRecord::Migration[7.1]
  def change
    add_column :transit_performances, :longitude, :float
    add_column :transit_performances, :latitude, :float
  end
end
