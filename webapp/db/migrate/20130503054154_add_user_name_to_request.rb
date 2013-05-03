class AddUserNameToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :userName, :string
  end
end
