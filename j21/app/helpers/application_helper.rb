module ApplicationHelper
	def require_login
	    unless logged_in?
	      flash[:warning] = "Tu dois être logé pour avoir la réponse a la grande question"
	      redirect_to login_path
    	end
  	end
end
