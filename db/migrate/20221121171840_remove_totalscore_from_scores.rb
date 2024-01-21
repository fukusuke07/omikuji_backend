class RemoveTotalscoreFromScores < ActiveRecord::Migration[6.1]
  def change
    remove_column :scores, :totalscore, :integer
  end
end
