class CreateProductMaterials < ActiveRecord::Migration
  def change
    create_join_table :products, :materials do |t|
      t.index :product_id
      t.index :material_id

      t.integer :units

      t.timestamps
    end
  end
end
