class RemoveTotalscoresFromScores < ActiveRecord::Migration[6.1]
  def change
    remove_column :scores, :total_score, :integer
    remove_column :scores, :draw_count, :integer
  end
end
