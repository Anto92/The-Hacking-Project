class AddUsernameToMousaillons < ActiveRecord::Migration[5.1]
  def change
    add_column :mousaillons, :username, :string
  end
end
