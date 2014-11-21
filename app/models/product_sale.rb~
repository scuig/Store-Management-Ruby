class ProductSale < ActiveRecord::Base
	belongs_to :sale
	belongs_to :product
	has_one :discount

	accepts_nested_attributes_for :product, :reject_if => :all_blank
	accepts_nested_attributes_for :sale, :reject_if => :all_blank
end
