class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.references :grade
      t.references :category

      t.timestamps
    end
  end
end
