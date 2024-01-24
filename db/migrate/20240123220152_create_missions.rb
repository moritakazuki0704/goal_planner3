class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.integer :user_id,null: false
      t.integer :commit_id,null: false
      t.string :memo

      t.timestamps
    end
  end
end
