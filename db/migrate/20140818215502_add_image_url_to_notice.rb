class AddImageUrlToNotice < ActiveRecord::Migration
  def change
  	add_column :notices, :image_url, :text
  	add_column :notices, :link_url, :text
  end
end
