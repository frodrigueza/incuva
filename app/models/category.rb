class Category < ActiveRecord::Base
	has_many :topics
	has_many :grades, through: :grade_categories
	has_many :grade_categories, dependent: :destroy
end
