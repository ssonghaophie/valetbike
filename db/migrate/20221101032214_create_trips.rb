class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer :trip_id
      t.string  :user_id
      t.integer :current_station_id
      t.integer :startTime
      t.integer :endTime
      t.string :review

      t.timestamps
    end
  end
end
