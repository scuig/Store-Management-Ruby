class AddIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :id, :serial
    add_index :users, :id 
  end
end
