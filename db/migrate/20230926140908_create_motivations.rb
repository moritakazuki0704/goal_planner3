class CreateMotivations < ActiveRecord::Migration[6.1]
  def change
    create_table :motivations do |t|
      t.integer :user_id , null: false
      t.integer :emotion_stetas, default: "0"
      t.text :appetite
      t.text :memory
      t.timestamps
    end
  end
end
