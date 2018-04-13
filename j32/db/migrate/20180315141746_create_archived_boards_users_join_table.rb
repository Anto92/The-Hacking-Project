class CreateArchivedBoardsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :archived_boards, :users
  end
end
