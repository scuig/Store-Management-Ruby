class Product < ActiveRecord::Base

	
	has_many :product_sales	
	has_many :sales, through: :product_sales

	has_many :product_categories       
	has_many :categories, through: :product_categories

	has_many :product_materials
	has_many :materials, through: :product_materials

	accepts_nested_attributes_for :materials
	accepts_nested_attributes_for :product_materials

	accepts_nested_attributes_for :categories
	accepts_nested_attributes_for :product_categories

end
