class Crib < ActiveRecord::Base
	validates :owner_id, presence: true
	
	belongs_to 	:owner
	has_many 	:tenants
end
