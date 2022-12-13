class AddInUseToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :in_use, :boolean,  default: false
    add_column :trips, :bike_id, :integer
    add_column :trips, :trip_id, :string
    change_column :trips, :user_id, :string
    add_column :users, :membership_status, :boolean, default: false
  end
end
