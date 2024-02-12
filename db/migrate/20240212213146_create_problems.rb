class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.integer :user_id, null: false
      t.string :commitment
      t.text :purpose
      t.integer :progress_stetas,default: "0"

      t.timestamps
    end
  end
end
