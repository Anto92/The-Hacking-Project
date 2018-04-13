# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     super
    puts '================================================'
    puts '================================================'
    puts '================================================'
    puts '===============SIGN IN=========================='
    puts '================================================'
    puts '================================================'
    puts '================================================'
    Board.create(user_id: current_user.id) if current_user.boards == []

    tempboard = Board.where(user_id: current_user.id)
    board = Board.find(tempboard.ids).last

    ids = User.pluck(:id)
    ids.delete_if {|id| id == current_user.id }
    fate = ids.shuffle[0..1]
    board.user_ids = [fate[0], fate[1]]
    board.users = [User.find(fate[0]), User.find(fate[1])]
    board.save
    
    current_user.randomize = false
    current_user.save
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
