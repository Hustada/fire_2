class AddImageToPit < ActiveRecord::Migration
  def change
    add_column :pits, :image, :string
  end
end
