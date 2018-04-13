class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def AddToCart
  	# Item.find(params[:chat_param]).cart_id = User.find(current_user.id).cart.id

  	item = Item.find(params[:id])
  	@userCart = current_user.cart
  	@userCart.items << item
  	# item = Item.find(params[:chat_param]).save
  	redirect_to cart_path(User.find(current_user.id).cart.id)
  end

  # def add_to_cart
  #   product = Product.find(params[:id])
  #   @userCart = current_user.cart
  #   @userCart.products << product
    # if @userCart.save
    #   flash[:success] = "Product was successfully added to cart!"
    #   redirect_back fallback_location: root_path
    # else
    #   flash.now[:danger] = @product.errors.full_messages.to_sentence
    #   redirect_back fallback_location: root_path
  #   end
  # end

end








