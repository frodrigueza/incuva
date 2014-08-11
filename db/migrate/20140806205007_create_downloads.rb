class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
    	t.references :member
    	t.references :content
    	t.integer :download_times, default: 1
      t.timestamps
    end
  end
end
