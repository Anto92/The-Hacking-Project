class AddIsMatchToArchivedBoard < ActiveRecord::Migration[5.1]
  def change
    add_column :archived_boards, :is_match, :boolean
  end
end
