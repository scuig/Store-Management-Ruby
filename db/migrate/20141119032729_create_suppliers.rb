class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.text :name
      t.text :address
      t.text :email
      t.text :phone

      t.timestamps
    end
  end
end
