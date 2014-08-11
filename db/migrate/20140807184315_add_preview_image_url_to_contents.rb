class AddPreviewImageUrlToContents < ActiveRecord::Migration
  def change
    add_column :contents, :preview_image_url, :text
  end
end
