class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :schedule_id , null: false
      t.string :task
      t.integer :priority_status, default: "0"
      t.integer :progress_status, default: "0"
      t.timestamps
    end
  end
end
