class ChangeUserLocation < ActiveRecord::Migration
  def change
    change_column :users, :location, :string
  end
end
