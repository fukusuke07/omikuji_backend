class AddCompetitionscoresToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :competition_score, :integer
    add_column :scores, :love_score, :integer
    add_column :scores, :money_score, :integer
  end
end
