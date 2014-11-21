class Discount < ActiveRecord::Base
	has_many :product_sales
end
