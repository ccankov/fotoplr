class RemovePhotoTitle < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :title
  end
end
