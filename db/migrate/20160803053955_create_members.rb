class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :image_url
      t.string :occupation
      t.string :email
      t.text :description

      t.boolean :is_professor, default: false
      t.boolean :is_alumni , default: false
      t.timestamps
    end
  end
end
