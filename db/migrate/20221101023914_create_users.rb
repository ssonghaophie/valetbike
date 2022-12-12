class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email, null: false
      t.string :password_digest
      t.string :trips
      t.string :plan
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
      t.string :subscription_status, default: "incomplete"
      t.index [:email], name: "index_users_on_email", unique: true
      t.index [:stripe_customer_id],

      t.timestamps
    end
  end

  def down
    drop_table(:users)
  end
end


