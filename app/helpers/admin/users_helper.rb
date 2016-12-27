module Admin::UsersHelper
	def activity_button_title(user)
		user.active ? 'Deactivate' : 'Activate'
	end
end
