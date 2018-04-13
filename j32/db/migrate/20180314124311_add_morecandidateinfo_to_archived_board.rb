class AddMorecandidateinfoToArchivedBoard < ActiveRecord::Migration[5.1]
  def change
  	add_column :archived_boards, :candidate_1_picture, :text
  	add_column :archived_boards, :candidate_1_firstname, :string
  	add_column :archived_boards, :candidate_1_lastname, :string
  	add_column :archived_boards, :candidate_1_bio, :text
  	add_column :archived_boards, :candidate_2_picture, :text
  	add_column :archived_boards, :candidate_2_firstname, :string
  	add_column :archived_boards, :candidate_2_lastname, :string
  	add_column :archived_boards, :candidate_2_bio, :text
  end
end
