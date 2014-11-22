class ProductMaterial < ActiveRecord::Base
	belongs_to :product
	belongs_to :material

	accepts_nested_attributes_for :material
end
