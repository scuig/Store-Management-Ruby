class InsertNameToMaterials < ActiveRecord::Migration
  def change
	add_column :materials, :name, :string
  end
end
