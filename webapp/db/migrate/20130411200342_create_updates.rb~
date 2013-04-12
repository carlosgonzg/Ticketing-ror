class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.datetime :date
      t.text :text
    end
  end
  def down
    drop_table :updates
  end
end
