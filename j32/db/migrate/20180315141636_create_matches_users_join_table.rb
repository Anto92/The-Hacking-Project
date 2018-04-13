class CreateMatchesUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :matches, :users
  end
end
