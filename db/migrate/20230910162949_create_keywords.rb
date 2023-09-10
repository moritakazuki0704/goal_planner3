class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.integer :user_id, null: false
      t.string :keyword_1
      t.string :keyword_2
      t.string :keyword_3
      t.string :keyword_4
      t.string :keyword_5
      t.string :keyword_6
      t.string :keyword_7
      t.string :keyword_8
      t.string :keyword_9
      t.string :keyword_10

      t.timestamps
    end
  end
end
