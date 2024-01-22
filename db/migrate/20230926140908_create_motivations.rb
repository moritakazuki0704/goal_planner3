class CreateMotivations < ActiveRecord::Migration[6.1]
  def change
    create_table :motivations do |t|
      t.integer :user_id , null: false
      t.integer :motivation_stetas, default: "0"
      t.string :positive_title
      t.text :positive_body
      t.text :positive_memory
      t.timestamps
    end
  end
end
