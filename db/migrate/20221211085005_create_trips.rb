class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
            t.integer :trip_id,null: false
            t.integer  :user_id, null: false
            t.integer :start_station_id, null: false
            t.integer :end_station_id
            t.datetime :start_time
            t.datetime :end_time
            t.string :review
      
      t.timestamps
    end
  end
end
