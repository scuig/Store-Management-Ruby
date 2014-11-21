class RenameProductsSalesToProductSales < ActiveRecord::Migration
  def change
	rename_table :products_sales, :product_sales
  end
end
