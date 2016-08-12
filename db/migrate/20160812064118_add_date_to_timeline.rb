class AddDateToTimeline < ActiveRecord::Migration[5.0]
  def change
    add_column :timelines, :date, :text
  end
end
