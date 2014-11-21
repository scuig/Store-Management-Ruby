class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.text :name
      t.text :abbr

      t.timestamps
    end
  end
end
