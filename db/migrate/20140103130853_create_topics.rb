class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.references :grade
      t.references :category

      t.timestamps
    end
  end
end
