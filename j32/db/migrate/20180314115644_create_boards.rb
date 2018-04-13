class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.integer :candidate_1_id
      t.integer :candidate_2_id
      t.integer :lock, default: 0
      t.text :candidate_1_picture
      t.string :candidate_1_firstname
      t.string :candidate_1_lastname
      t.text :candidate_1_bio
      t.text :candidate_2_picture
      t.string :candidate_2_firstname
      t.string :candidate_2_lastname
      t.text :candidate_2_bio

      t.timestamps
    end
  end
end
