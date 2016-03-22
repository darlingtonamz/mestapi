class CribsController < ApplicationController
	def index
		@cribs = Crib.all
	end

	def show
		@crib = Crib.find_by_id(params[:id])
		if (@crib)
			@owner = @crib.owner
			@tenants = @crib.tenants
		else
			@error = {
				code: 815,
				message: "The Crib with id #{params[:id]} doesn't exist"
			}
			render json: "error", status: 404
		end

		respond_to do |format|
			format.json
		end
	end

	def create

	end

end
