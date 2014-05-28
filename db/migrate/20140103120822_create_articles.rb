class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.references :topic
    	t.text :title
    	t.text :description

      t.timestamps
    end
  end
end
