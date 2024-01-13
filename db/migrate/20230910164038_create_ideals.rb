class CreateIdeals < ActiveRecord::Migration[6.1]
  def change
    create_table :ideals do |t|
      t.integer :user_id , null: false
      t.string :keyword_1
      t.string :keyword_2
      t.string :keyword_3
      t.string :keyword_4
      t.string :keyword_5
      t.string :keyword_6
      t.string :keyword_7
      t.string :keyword_8
      t.string :keyword_9
      t.string :keyword_10
      t.text :personality_1
      t.text :personality_2
      t.text :personality_3
      t.text :hair_make
      t.text :body_make
      t.text :fashion_make
      t.text :lifestyle_1
      t.text :lifestyle_2
      t.text :lifestyle_3
      t.text :time_1
      t.text :time_2
      t.text :time_3
      t.text :working_1
      t.text :working_2
      t.text :working_3
      t.text :residence_1
      t.text :residence_2
      t.text :residence_3
      t.text :relationship_1
      t.text :relationship_2
      t.text :relationship_3
      t.text :partner_1
      t.text :partner_2
      t.text :partner_3
      t.text :partner_model
      t.text :family_model
      t.text :friend_model
      t.timestamps
    end
  end
end
