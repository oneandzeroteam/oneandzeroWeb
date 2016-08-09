class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :user
      t.string :references

      t.integer :post_id

      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
