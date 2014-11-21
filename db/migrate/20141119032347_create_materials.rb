class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.decimal :available

      t.timestamps
    end
  end
end
