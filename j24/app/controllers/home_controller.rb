class HomeController < ApplicationController
  def index
  	@gossips = Gossip.all 
  	if mousaillon_signed_in?
  		render "index"
  	else
  		redirect_to new_mousaillon_session_path
  	end
  end
end
