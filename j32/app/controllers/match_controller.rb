class MatchController < ApplicationController
  def index
    @matches = Match.where(user_id: current_user.id)
    @allmatches = Match.all
    @as_selected = []
    @allmatches.each do |m|
      if m.user_ids.first == current_user.id || m.user_ids.last == current_user.id
        @as_selected << m
      end
    end
  end

  def show
    @match = Match.find(params[:id])
    @candidate_1 = User.find(@match.user_ids.first)
    @candidate_2 = User.find(@match.user_ids.last)
  end
end
