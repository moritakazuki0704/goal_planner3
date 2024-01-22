class CreateCommits < ActiveRecord::Migration[6.1]
  def change
    create_table :commits do |t|
      t.integer :user_id, null: false
      t.string :commitment
      t.text :purpose
      t.boolean :finish,default: "false"

      t.timestamps
    end
  end
end
