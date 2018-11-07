module ApplicationHelper
	def is_admin
		return session[:admin]
	end
end
