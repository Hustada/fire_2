class ChangeUserLocation < ActiveRecord::Migration
  def change
    change_column :users, :location, :state
  end
end
