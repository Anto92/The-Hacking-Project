class CreateArchivedBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :archived_boards do |t|
      t.integer :user_id
      t.integer :candidate_1_id
      t.integer :candidate_2_id
      t.integer :lock

      t.timestamps
    end
  end
end
