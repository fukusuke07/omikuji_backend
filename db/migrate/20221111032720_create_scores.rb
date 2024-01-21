class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.integer :user_id, null: false
      t.integer :totalscore, null: false  

      t.timestamps
    end
  end
end
