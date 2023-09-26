class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.integer :user_id , null: false
      t.string :mission_statement
      t.text :mission_detail
      t.timestamps
    end
  end
end
