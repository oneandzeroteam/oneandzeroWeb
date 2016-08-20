class CreateBorrowablestuffs < ActiveRecord::Migration[5.0]
  def change
    create_table :borrowablestuffs do |t|
      t.string :stufftype                  , comment: "e.g. Monitor"
      t.string :stuffstrcode               , comment: "e.g. MON"
      t.integer :stuffintcode              , comment: "e.g. 02"
      t.string :stuffcode                  , comment: "e.g. MON02"
      t.text :description
      t.string :image_url

      t.integer :max_lendingperiod         , null: false, default: 14
      t.integer :lended_period

      t.boolean :is_borrowed , default: false

      t.datetime :lended_at
      t.references :lastest_lended_user, references: :user, comment: "lastest_lended_user"
      t.references :current_lended_user, references: :user, comment: "current_lended_user"

      t.timestamps
    end
  end
end
