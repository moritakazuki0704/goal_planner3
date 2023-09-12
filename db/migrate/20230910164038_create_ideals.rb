class CreateIdeals < ActiveRecord::Migration[6.1]
  def change
    create_table :ideals do |t|
      t.integer :user_id , null: false
      t.integer :ideal_status
      t.text :text_1
      t.text :text_2
      t.text :text_3

      t.timestamps
    end
  end
end
