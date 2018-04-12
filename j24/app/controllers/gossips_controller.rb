class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = current_mousaillon.gossips.build
  end

  def create
  	@gossip = current_mousaillon.gossips.build(gossip_params)
  	@gossip.anonymous_author = current_mousaillon.username
  	@gossip.save
  	redirect_to @gossip
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end

  def edit
  	@gossip = Gossip.find(params[:id])
  end

  def update
  	@gossip = Gossip.find(params[:id])
  	@gossip.update(gossip_params)
  	redirect_to @gossip
  end

  def destroy
  	@gossip = Gossip.find(params[:id])
  	if @gossip.mousaillon.username == current_mousaillon.username
	  	@gossip.destroy
	  	redirect_to gossips_path
	  	flash[:success] = "You successfully deleted your gossip !"
	else
		redirect_to gossips_path
		flash[:danger] = "You can't delete a gossip you didn't write !"
	  end
  end

  private
  def gossip_params
    params.require(:gossip).permit(:content)
  end
end
