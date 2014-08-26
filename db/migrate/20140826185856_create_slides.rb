class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.text :image_url
      t.text :link_url
      t.integer :play_order, default: -1

      t.timestamps
    end
  end
end
