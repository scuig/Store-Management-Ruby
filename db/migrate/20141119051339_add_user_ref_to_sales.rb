class AddUserRefToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :user
  end
end
