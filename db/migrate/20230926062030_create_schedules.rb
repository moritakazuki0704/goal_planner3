class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :user_id , null: false
      t.integer :schedule_status,default: "1"
      t.string :title
      t.text :body
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
