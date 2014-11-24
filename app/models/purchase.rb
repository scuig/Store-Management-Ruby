class Purchase < ActiveRecord::Base

	

	belongs_to :user
	belongs_to :supplier

	has_many :material_purchases
	has_many :materials, through: :material_purchases

	accepts_nested_attributes_for :materials
	accepts_nested_attributes_for :material_purchases
end
