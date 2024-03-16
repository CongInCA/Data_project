class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.integer :age
      t.string :license_number

      t.timestamps
    end
  end
end
