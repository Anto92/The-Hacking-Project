class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :bio, :text
    add_column :users, :phone, :string
    add_column :users, :match_count, :integer
    add_column :users, :karma, :integer, default: 10
    add_column :users, :city, :string
    add_column :users, :gender, :integer
  end
end
