class CribsController < ApplicationController
	def index
		@cribs = Crib.all
	end

	def show
		@crib = Crib.find_by_id(params[:id])
		if (!@crib)
			@error = {
				code: 815,
				message: "The Crib with id #{params[:id]} doesn't exist"
			}
			render "error", status: 404
		end

		respond_to do |format|
			format.json
		end
	end

	def create
		#puts "#"*100
		respond_to do |format|
			format.json{
				begin
					begin
						@crib = Crib.new(crib_param[:data])
						@crib.owner_id = crib_param[:rels][:owner][:id]
					rescue
						puts "#"*100+" \n raised: 1"
						raise "0"
					end

					if @crib.save
						render "show"
					else
						puts "*"*100+" \n raised: 1"
						raise "1"
					end
				rescue => ex
					err = [422, 500]
					mess = ["Details for creation of Crib not complete", "Unable to save data"]
					@error = {
						code: err[ex.to_s.to_i],
						message: mess[ex.to_s.to_i],
					}
					render "error", status: err[ex.to_s.to_i]
				end
			}
		end


	end

	private
		def crib_param
			params.require(:crib).permit(data:[:name, :length, :bredth, :location], rels:[owner: [:id, :name, :email]])
		end
end
