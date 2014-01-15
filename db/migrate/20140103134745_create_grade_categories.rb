class CreateGradeCategories < ActiveRecord::Migration
  def change
    create_table :grade_categories do |t|
    	t.references :grade
    	t.references :category
      t.timestamps
    end
  end
end
