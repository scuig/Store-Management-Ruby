class Sale < ActiveRecord::Base
	
	after_validation :checar_tablas

	def checar_tablas





	end


	belongs_to :client
	belongs_to :user
	
	has_many :product_sales
	has_many :products, through: :product_sales, :class_name => "Product"

	accepts_nested_attributes_for :products
	accepts_nested_attributes_for :product_sales

end
