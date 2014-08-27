class AddSummaryToPits < ActiveRecord::Migration
    def change
    add_column :pits, :summary, :text
  end
end
