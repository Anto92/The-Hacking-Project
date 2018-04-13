class CartsController < ApplicationController
  # def index
  # 	@cart  	
  # end
  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:id])
    @cart.user_id = current_user.id
    @cart.save
  end

  def destroy
    Cart.destroy(params[:id])
  end
end
