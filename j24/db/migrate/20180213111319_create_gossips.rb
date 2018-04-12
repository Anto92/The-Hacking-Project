class CreateGossips < ActiveRecord::Migration[5.1]
  def change
    create_table :gossips do |t|
      t.string :content
      t.integer :mousaillon_id

      t.timestamps
    end
  end
end
