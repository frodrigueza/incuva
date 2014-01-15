class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.integer :level
    	t.references :topic
    	t.string :title
    	t.string :description

      t.timestamps
    end
  end
end
