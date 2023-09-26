class CreateMotivations < ActiveRecord::Migration[6.1]
  def change
    create_table :motivations do |t|
      t.integer :user_id , null: false
      t.integer :motivation_status
      t.text :motivation_body
      t.timestamps
    end
  end
end
