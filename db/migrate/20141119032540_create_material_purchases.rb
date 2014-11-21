class CreateMaterialPurchases < ActiveRecord::Migration
  def change
    create_join_table :materials, :purchases do |t|
      t.index :material_id
      t.index :purchase_id
      
      t.integer :units
      t.date :exp_date
      t.decimal :amount

      t.timestamps
    end
  end
end
