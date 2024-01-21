class AddTotalscoresToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :total_score, :integer, null: false
    add_column :scores, :draw_count, :integer, null: false
  end
end
