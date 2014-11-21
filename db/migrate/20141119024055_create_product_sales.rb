class CreateProductSales < ActiveRecord::Migration
  def change
    create_join_table :products, :sales do |t|
      
      t.index :product_id
      t.index :sale_id

      t.integer :discount_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
