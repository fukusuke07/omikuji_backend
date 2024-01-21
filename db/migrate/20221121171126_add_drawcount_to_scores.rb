class AddDrawcountToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :draw_count, :integer
  end
end
