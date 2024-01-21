class RemoveCanredrawFromScores < ActiveRecord::Migration[6.1]
  def change
    remove_column :scores, :canredraw, :boolean
  end
end
