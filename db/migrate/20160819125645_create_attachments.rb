class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.integer :post_id
      t.integer :timeline_id
      t.integer :borrowablestuff_id
      t.integer :member_id
      t.integer :project_id

      t.string :image_url

      t.timestamps
    end
  end
end
