class User < ActiveRecord::Base
	has_many :sales, dependent: :destroy
	has_many :purchases
end
