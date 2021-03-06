class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    log_in @user
	  flash[:success] = "Welcome to the greatest Event organisation app ever created!"
    redirect_to @user  	
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
