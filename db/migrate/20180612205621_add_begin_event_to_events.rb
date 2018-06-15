class AddBeginEventToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :begin_event, :datetime
  end
end
