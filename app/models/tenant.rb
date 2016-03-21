class Tenant < ActiveRecord::Base
	belongs_to :crib
	belongs_to :owner
end
