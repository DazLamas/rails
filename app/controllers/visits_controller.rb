class VisitsController < ApplicationController
  
	  def index
	  	@location = Location.find(params[:location_id])
	 	@visits = @location.visits
	 	#@visit_this = Visit.find(params[:id])
	  end

	  def show
	  	@visit = Visit.find(params[:id])
	  	@location = Location.find(params[:location_id])
	  end

	  def new 
	  	@location = Location.find(params[:location_id])
	  	@visit = @location.visits.new
	  end

	def	create	
		@location = Location.find(params[:location_id])
		@visit = @location.visits.new visit_params
		
		if	@visit.save	
			flash[:notice] = "Entrada guardada!!"
			redirect_to	action: 'index', controller: 'visits', location_id: @location.id
		else	
			flash[:error] = "Fata Error. Vuelve a introducir los datos"
			render	'new'	
		end	
	end

	def edit
		@location = Location.find(params[:location_id])
	  	@visit = Visit.find(params[:id])
	end
 	
 	def update
 		@location = Location.find(params[:location_id])
		@visit = Visit.find(params[:id])
		
		if	@visit.update_attributes(visit_params)
			redirect_to	action: 'show', controller: 'visits', location_id: @location.id
			# esto es igual a: redirect_to	location_visits_path @location
			# Le inidicamos la location_id por si quires enviarle a otro sitio

		else	
			render	'edit'	
		end	
 	end

 	def destroy

 		visit = Visit.find(params[:id])#
 		visit.destroy
 		redirect_to action: 'index', controller: 'visits'

 		#visit = Visit.destroy(params[:id])


 	end

 ##########
	private

	def visit_params
		
		params.require(:visit).permit(:user_name, :from_date, :to_date)

	end


end
