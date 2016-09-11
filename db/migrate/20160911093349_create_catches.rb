class CreateCatches < ActiveRecord::Migration[5.0]
  def change
    create_table :catches do |t|
      t.belongs_to :user
      t.string :species
      t.decimal :weight
      t.integer :length
      t.float :lang
      t.float :lat

      t.timestamps
    end
  end
end
