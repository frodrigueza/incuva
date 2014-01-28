class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.integer :level
    	t.references :topic
    	t.text :title

      t.timestamps
    end
  end
end
