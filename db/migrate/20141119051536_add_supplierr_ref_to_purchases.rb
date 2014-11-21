class AddSupplierrRefToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :supplier
  end
end
