class ApplicationController < ActionController::Base
	helper_method :star_text
	helper_method :current_user
	

	protected

	def current_user
		@current_user||=User.find_by(id: session[:user_id])
		unless @current_user
			redirect_to login_url , alert: "please log in"
		end
	end

	
	def star_text
		return @favorite_exists ? "Unstar" : "Star" 
	end
	

end
