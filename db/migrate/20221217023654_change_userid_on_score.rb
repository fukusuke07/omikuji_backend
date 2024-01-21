class ChangeUseridOnScore < ActiveRecord::Migration[6.1]
  def change
    change_column_null :scores, :user_id, true
  end
end
