class AddEndEventToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :end_event, :datetime
  end
end
