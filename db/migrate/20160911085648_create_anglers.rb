class CreateAnglers < ActiveRecord::Migration[5.0]
  def change
    create_table :anglers do |t|
      t.string :name
      t.string :email, unique: true, null: false

      t.timestamps
    end
  end
end
