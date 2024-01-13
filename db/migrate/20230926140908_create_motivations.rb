class CreateMotivations < ActiveRecord::Migration[6.1]
  def change
    create_table :motivations do |t|
      t.integer :user_id , null: false
      t.text :positive_motivation_1
      t.text :positive_motivation_2
      t.text :positive_motivation_3
      t.text :positive_motivation_4
      t.text :positive_motivation_5
      t.text :negative_motivation_1
      t.text :negative_motivation_2
      t.text :negative_motivation_3
      t.text :negative_motivation_4
      t.text :negative_motivation_5
      t.text :to_do_motivation_1
      t.text :to_do_motivation_2
      t.text :to_do_motivation_3
      t.text :to_do_motivation_4
      t.text :to_do_motivation_5
      t.text :want_motivation_1
      t.text :want_motivation_2
      t.text :want_motivation_3
      t.text :want_motivation_4
      t.text :want_motivation_5
      t.timestamps
    end
  end
end
