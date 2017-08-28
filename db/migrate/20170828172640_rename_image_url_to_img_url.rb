class RenameImageUrlToImgUrl < ActiveRecord::Migration
  def change
    rename_column :topics, :image_url, :img_url
  end
end
