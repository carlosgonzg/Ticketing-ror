class UserTable < ActiveRecord::Migration
  def change
    create_table :Users do |t|
      t.column :name, 'UserType', :null => false

      t.timestamps
    end
  end
end
