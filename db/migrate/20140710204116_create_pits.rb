class CreatePits < ActiveRecord::Migration
  def change
    create_table :pits do |t|

      t.timestamps
    end
  end
end
