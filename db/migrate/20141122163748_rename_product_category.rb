class RenameProductCategory < ActiveRecord::Migration
  def change
  	rename_table :category_products, :product_categories
  end
end
