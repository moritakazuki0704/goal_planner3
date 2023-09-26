class CreateValues < ActiveRecord::Migration[6.1]
  def change
    create_table :values do |t|
      t.integer :motivation_id , null: false
      t.integer :price
      t.timestamps
    end
  end
end
