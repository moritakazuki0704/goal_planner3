class CreateMotivations < ActiveRecord::Migration[6.1]
  def change
    create_table :motivations do |t|
      t.integer :user_id , null: false
      t.integer :motivation_status
      t.text :motivation_1
      t.text :motivation_2
      t.text :motivation_3
      t.text :motivation_4
      t.text :motivation_5
      t.timestamps
    end
  end
end
