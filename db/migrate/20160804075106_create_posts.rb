class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.integer :board_id

      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
