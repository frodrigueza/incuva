class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :url
      t.text :name
      t.references :article

      t.timestamps
    end
  end
end
