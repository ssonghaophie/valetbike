class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.integer :identifier
      t.string :name
      t.string :address
      t.integer :docked_bike_count
      # t.has_many :bikes
      t.timestamps
    end
  end
end
