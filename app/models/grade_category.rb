class GradeCategory < ActiveRecord::Base
	belongs_to :grade
	belongs_to :category
end
