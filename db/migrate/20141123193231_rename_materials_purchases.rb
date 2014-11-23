class RenameMaterialsPurchases < ActiveRecord::Migration
  def change
  	rename_table :materials_purchases, :material_purchases
  end
end
