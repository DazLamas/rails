class LocationsController < ApplicationController
  	def index
  		@locations = Location.last_created(10)
  	end
  	def show
 		@location = Location.find(params[:id])
 	end
 	def new 
	  	@location = Location.new
	  	
	end

	def create

		@location = Location.new location_params

		if	@location.save	

			flash[:notice] = "Entrada guardada!!"
			redirect_to	action: 'index', controller: 'locations'
		else	
			flash[:error] = "Fata Error. Vuelve a introducir los datos"
			render	'new'	
		end	
		
	end


private

	def location_params
		
		params.require(:location).permit(:name, :city, :lat, :long)

	end

end
