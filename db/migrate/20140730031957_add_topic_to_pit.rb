class AddTopicToPit < ActiveRecord::Migration
  def change
    add_column :pits, :topic, :text
  end
end
