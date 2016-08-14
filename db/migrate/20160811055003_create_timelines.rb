class CreateTimelines < ActiveRecord::Migration[5.0]
  def change
    create_table :timelines do |t|
      t.string :title
      t.text :content
      t.string :image_url
      t.datetime :date

      t.timestamps
    end
  end
end
