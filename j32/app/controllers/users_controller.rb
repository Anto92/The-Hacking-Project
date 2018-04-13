class UsersController < ApplicationController
  def show
  end

  def carousel
  end

  def ranking
    @bestusers = User.all.order(:karma).reverse
  end
end
