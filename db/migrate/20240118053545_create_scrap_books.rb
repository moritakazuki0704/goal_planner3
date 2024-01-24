class CreateScrapBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :scrap_books do |t|
      t.integer :user_id
      t.string :title
      t.text :comment
      t.timestamps
    end
  end
end
