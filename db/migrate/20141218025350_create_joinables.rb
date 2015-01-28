class CreateJoinables < ActiveRecord::Migration
  def change
    create_table :joinables do |t|
      t.integer :pit_id
      t.integer :user_id

      t.timestamps
    end
  end
end
