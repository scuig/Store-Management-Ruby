class AddUnitRefToMaterials < ActiveRecord::Migration
  def change
    add_reference :materials, :unit
  end
end
