class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :purchase_date

      t.timestamps
    end
  end
end
