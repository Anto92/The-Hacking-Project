class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])

  		log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		flash[:success] = "Bienvenue sur ton profil !"

  		redirect_to user
  	else
  		flash.now[:danger] = "Combinaison email/mot de passe incorrect.."
  		render "new"
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to login_path
  end
end
