class AddTotalscoreToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :total_score, :integer
  end
end
