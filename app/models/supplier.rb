class Supplier < ActiveRecord::Base
	has_many :Purchases
end
