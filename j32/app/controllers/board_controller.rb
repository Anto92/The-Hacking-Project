class BoardController < ApplicationController
before_action :my_authentication

  def my_authentication
     unless user_signed_in? 
        redirect_to users_carousel_path
     end
  end

  def random
    puts '================'
    puts '================'
    puts '==RANDOM START=='
    puts '================'
    puts '================'

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
 
  def show
    #tempboard = Board.where(user_id: current_user.id)
    if current_user.randomize == true
      self.random
    end
    tempboard = Board.where(user_id: current_user.id)
    board = Board.find(tempboard.ids).last
    @candidate_1 = board.users.first
    @candidate_2 = board.users.last
  end
 
  def next
    tempboard = Board.where(user_id: current_user.id)
    board = Board.find(tempboard.ids).last
    candidate_1 = board.users.first
    candidate_2 = board.users.last
    
    ab = ArchivedBoard.new(user_id: current_user.id)
    ab.user_ids=[candidate_1.id, candidate_2.id]
    ab.is_match = false
    ab.save
    
    current_user.randomize = true
    current_user.save
    
    redirect_to root_path
  end
 
  def confirmation
    tempboard = Board.where(user_id: current_user.id)
    board = Board.find(tempboard.ids).last
    @candidate_1 = board.users.first
    @candidate_2 = board.users.last
  end
 
  def match
    tempboard = Board.where(user_id: current_user.id)
    board = Board.find(tempboard.ids).last
    candidate_1 = board.users.first
    candidate_2 = board.users.last
    
    ab = ArchivedBoard.new(user_id: current_user.id)
    ab.user_ids=[candidate_1.id, candidate_2.id]
    ab.is_match = true
    ab.save
    
    m = Match.new(user_id: current_user.id)
    m.user_ids=[candidate_1.id, candidate_2.id]
    candidate_1.karma += 1
    candidate_2.karma += 1
    candidate_1.save!
    candidate_2.save!
    m.save
    
    current_user.randomize = true
    current_user.karma += 2
    current_user.save
    redirect_to board_share_path
  end
 
##################################################################
 
  def share
  end
 
  def index
  end
 
  def get_ids
  end
end
