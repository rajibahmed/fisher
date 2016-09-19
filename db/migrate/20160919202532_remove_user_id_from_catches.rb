class RemoveUserIdFromCatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :catches, :user_id
  end
end
