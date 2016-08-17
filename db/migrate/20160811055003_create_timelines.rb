class CreateTimelines < ActiveRecord::Migration[5.0]
  def change
    create_table :timelines do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.string :image_caption
      t.string :content_title
      t.text :content_body
      t.datetime :date

      t.timestamps
    end
  end
end
