class Admin::ApplicationController < ApplicationController
	before_filter :authenticate_user!
	before_filter :authorize_user!

	def authorize_user!
		redirect_to root_path unless current_user.admin?
	end
end
