class UserTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.integer :UserType
      t.text :Fullname
      t.text :Username
      t.text :password_digest
      t.text :email
      t.timestamps
    end
  end

  def down
	drop_table :users
  end
end
