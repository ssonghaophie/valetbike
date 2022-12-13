class AddMembershipStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :membership_status, :boolean
  end
end
