class AddRandomizeToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :reset, :randomize
  end
end
