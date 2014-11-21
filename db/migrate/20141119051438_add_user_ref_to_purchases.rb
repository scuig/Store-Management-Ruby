class AddUserRefToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :user
  end
end
