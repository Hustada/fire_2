class DropJoinables < ActiveRecord::Migration
	def up
		drop_table :joinables
	end

	def down
		create_table :joinables do |t|
  	t.integer :pit_id
  	t.integer :user_id

  	t.timestamps
		end
	end
end