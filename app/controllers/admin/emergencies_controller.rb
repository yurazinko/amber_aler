class Admin::EmergenciesController < ApplicationController
	def destroy
		Emergency.find(params[:id]).destroy!
		redirect_to [:emergencies]
	end
end
