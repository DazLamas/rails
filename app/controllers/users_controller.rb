class UsersController < ApplicationController

	def index

		@users = User.last_created(10)

		@location = Location.find
		
	end

	def new

		@user = User.new
		
	end

	def create

		@user = User.new user_params

		if	@user.save	

			flash[:notice] = "Usuario registrado :D"
			redirect_to	action: 'index', controller: 'users'
		else	
			flash[:error] = "Fatal Error. Vuelve a introducir los datos"
			render	'new'	
		end	
		
	end


private

	def user_params
		
		params.require(:user).permit(:user_name, :email)

	end


end
