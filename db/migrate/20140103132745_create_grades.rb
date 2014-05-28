class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :level
      t.references :category

      t.timestamps
    end
  end
end
