class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :urgent
      t.integer :IssueType
      t.text :ComputerName
      t.text :Subject
      t.text :Description
      t.text :Solution
      t.text :Status
      t.text :email
      t.text :userName
      t.text :owner
      t.timestamps
      t.boolean :complete, :default => false 
    end
  end
  def down
    drop_table :requests
  end
end
