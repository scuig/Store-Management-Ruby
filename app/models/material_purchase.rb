class MaterialPurchase < ActiveRecord::Base
	belongs_to :material
	belongs_to :purchase
end
