class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :urgent
      t.integer :IssueType
      t.text :ComputerName
      t.text :Subject
      t.text :Description

      t.timestamps
    end
  end
end
