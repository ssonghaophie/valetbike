class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.integer :identifier
      t.string :name
      t.string :address
      t.float "latitude", precision: 10, scale: 6, null: false, default: 0
      t.float "longitude", precision: 10, scale: 6, null: false, default: 0
      t.integer :docked_bike_count
      t.has_many :bikes
      t.timestamps
    end
  end
end
