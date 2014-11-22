class RenameMaterialsTable < ActiveRecord::Migration
  def change
  	rename_table :materials_products, :product_materials
  end
end
