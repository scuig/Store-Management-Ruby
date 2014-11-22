class RenameProductCategories < ActiveRecord::Migration
  def change
	rename_table :categories_products, :category_products
  end
end
