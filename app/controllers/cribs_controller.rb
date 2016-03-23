class CribsController < ApplicationController
	def index
		@cribs = Crib.all
	end

	def show
		respond_to do |format|
			format.json{
				@crib = Crib.find_by_id(params[:id])
				if (!@crib)
					show_error "0"
				end
			}
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
						raise "1"
					end

					if @crib.save
						render "show"
					else
						raise "2"
					end
				rescue => ex
					show_error(ex)
				end
			}
		end
	end

	def update
		respond_to do |format|
			format.json{
				begin
					begin
						puts "#"*100+" \n : " + crib_param[:rels][:owner][:id].to_s
						owner = Owner.find(crib_param[:rels][:owner][:id])
					rescue
						raise "0"
					end

					@crib = Crib.find_by_id(params[:id])
					if @crib
						if @crib.update(crib_param[:data])
							render "show"
						else
							raise "1"
						end
					else
						@crib = Crib.new(crib_param[:data])
						@crib.id = params[:id]
						if !@crib.save
							raise "2"
						end
					end

				rescue => ex
					show_error(ex)
				end
			}
		end
	end

	def show_error (ex)
		err = [404, 422, 500]
		mess = ["Not found", "Details for creation of Crib not complete", "Unable to save data"]
		@error = {
			code: err[ex.to_s.to_i],
			message: mess[ex.to_s.to_i]
		}
		render "error", status: err[ex.to_s.to_i]
	end

	private
		def crib_param
			params.require(:crib).permit(data:[:name, :length, :bredth, :location], rels:[owner: [:id, :name, :email]])
		end
end
