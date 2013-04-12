class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.datetime :Date
      t.text :UpdateText
      t.integer :request_id

      t.timestamps
    end
  end
  def down
    drop_table :updates
  end
end

