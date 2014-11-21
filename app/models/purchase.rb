class Purchase < ActiveRecord::Base
	belongs_to :user
	belongs_to :supplier
	has_many :materials, through: :materials_purchases
end
