class CreateTimelines < ActiveRecord::Migration[5.0]
  def change
    create_table :timelines do |t|
      t.string :title
      t.text :contents
      t.string :image
      t.string :date

      t.timestamps
    end
  end
end
