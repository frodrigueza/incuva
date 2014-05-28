class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :url
      t.text :name
      t.references :article
      t.integer :content_type

      t.timestamps
    end
  end
end
