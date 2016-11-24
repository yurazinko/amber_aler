class EmergenciesController < ApplicationController
	def index
		@emergencies = Emergency.all
	end

	def show
		@emergency = Emergency.find(params[:id])
	end

	def new
		@emergency = Emergency.new
	end

	def create
		@emergency = Emergency.new(params[:emergency])
		if @emergency.save
			redirect_to emergencies_path
		else
			render 'new'
		end
	end

	def edit
		@emergency = Emergency.find(params[:id])
	end

	def update
		@emergency = Emergency.find(params[:id])
		if @emergency.update_attributes(params[:emergency])
			redirect_to emergencies_path
		else
			render 'edit'
		end			
	end

	def destroy
		@emergency = Emergency.find(params[:id])
		@emergency.destroy
		redirect_to emergencies_path
	end
end
