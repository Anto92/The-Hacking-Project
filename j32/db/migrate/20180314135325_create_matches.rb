class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :candidate_1_id
      t.integer :candidate_2_id
      t.integer :lock
      t.text :candidate_1_picture
      t.string :candidate_1_firstname
      t.string :candidate_1_lastname
      t.text :candidate_1_bio
      t.text :candidate_2_picture
      t.string :candidate_2_firstname
      t.string :candidate_2_lastname
      t.text :candidate_2_bio
      t.integer :user_id

      t.timestamps
    end
  end
end
