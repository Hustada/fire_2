class AddVideoToPit < ActiveRecord::Migration
  def change
    add_column :pits, :video_url, :string
  end
end
