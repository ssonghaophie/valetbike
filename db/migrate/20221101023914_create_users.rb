class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email, null: false
      t.string :password_digest
      t.string :trips
      t.timestamps
    end
  end

  def down
    drop_table(:users)
  end
end


