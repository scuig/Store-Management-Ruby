class Material < ActiveRecord::Base

	validates :available, numericality: { greater_than: 0, message: 'La cantidad debe ser mayor que 0' }
	validates :name, presence: {presence: true, message: 'Debe contener un nombre'}
	has_many :products_materials
	has_many :products, through: :products_materials

	has_many :materials_purchases
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
