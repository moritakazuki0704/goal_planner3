class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :user_id , null: false
      t.integer :commit_id ,null: false
      t.string :title
      t.text :body
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
