class AddFishPhotoToCatches < ActiveRecord::Migration[5.0]
  def change
    add_column :catches, :fish_photo, :string
  end
end
