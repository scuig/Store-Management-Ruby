class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :saleDate

      t.timestamps
    end
  end
end
