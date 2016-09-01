class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title

      t.text :short_description
      t.text :long_description

      t.string :image_url
      t.string :reference_url

      t.boolean :is_ongoing

      t.timestamps
    end
  end
end
