class AddEmailToCatches < ActiveRecord::Migration[5.0]
  def change
    add_column :catches, :email, :string, null: false
  end
end
