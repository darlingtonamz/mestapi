class CribsController < ApplicationController
	def index
		@cribs = Crib.all
	end

	def show
		@crib = Crib.find(params[:id])
		@owner = @crib.owner
		@tenants = @crib.tenants
	end
end
