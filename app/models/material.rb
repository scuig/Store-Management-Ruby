class Material < ActiveRecord::Base
	has_many :products, through: :products_materials
	has_many :purchases, through: :materials_purchases
	has_one :unit, :class_name => Unit, :foreign_key => "id", :primary_key => "unit_id"

def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |material|
        csv << material.attributes.values_at(*column_names)
      end
end
end
end
