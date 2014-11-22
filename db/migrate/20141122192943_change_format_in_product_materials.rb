class ChangeFormatInProductMaterials < ActiveRecord::Migration
  def change
  	change_column :product_materials, :units, :decimal
  end
end
