class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :schedule_id , null: false
      t.string :task
      t.integer :priority_status
      t.integer :progress_status
      t.timestamps
    end
  end
end
