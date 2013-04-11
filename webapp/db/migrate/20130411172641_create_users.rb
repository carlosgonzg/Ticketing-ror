class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, 'UserType', :null => false

      t.timestamps
    end
  end
  def down
    drop_table :users
  end
end
