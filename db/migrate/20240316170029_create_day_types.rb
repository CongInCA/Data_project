class CreateDayTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :day_types do |t|
      t.integer :day_id
      t.string :day_type

      t.timestamps
    end
  end
end
