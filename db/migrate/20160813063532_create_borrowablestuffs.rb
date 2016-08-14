class CreateBorrowablestuffs < ActiveRecord::Migration[5.0]
  def change
    create_table :borrowablestuffs do |t|
      t.string :stufftype                  , comment: "e.g. Monitor"
      t.string :stuffcode                  , comment: "e.g. 02MON"
      t.text :description
      t.string :image_url

      t.integer :max_lendingperiod         , default: 14
      t.integer :lended_period

      t.datetime :lended_at
      t.references :lastest_lended_user, references: :user, comment: "lastest_rended_user"
      t.references :current_lended_user, references: :user, comment: "current_rended_user"

      t.timestamps
    end
  end
end