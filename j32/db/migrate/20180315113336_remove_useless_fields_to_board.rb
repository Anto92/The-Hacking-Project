class RemoveUselessFieldsToBoard < ActiveRecord::Migration[5.1]
  def change
      remove_column :boards,  :candidate_1_id
      remove_column :boards,  :candidate_2_id
      remove_column :boards,  :candidate_1_picture
      remove_column :boards,  :candidate_1_firstname
      remove_column :boards,  :candidate_1_lastname
      remove_column :boards,  :candidate_1_bio
      remove_column :boards,  :candidate_2_picture
      remove_column :boards,  :candidate_2_firstname
      remove_column :boards,  :candidate_2_lastname
      remove_column :boards,  :candidate_2_bio
  end
end
