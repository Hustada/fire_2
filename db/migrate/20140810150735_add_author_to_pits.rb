class AddAuthorToPits < ActiveRecord::Migration
  def change
    add_column :pits, :author, :string
  end
end
