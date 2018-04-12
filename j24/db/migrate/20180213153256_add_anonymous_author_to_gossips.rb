class AddAnonymousAuthorToGossips < ActiveRecord::Migration[5.1]
  def change
    add_column :gossips, :anonymous_author, :string
  end
end
