class AddClientRefToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :client
  end
end
