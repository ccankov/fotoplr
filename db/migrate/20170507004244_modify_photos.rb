class ModifyPhotos < ActiveRecord::Migration[5.0]
  def change
    rename_column :photos, :url, :title
  end
end
