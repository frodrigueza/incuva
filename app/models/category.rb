class Category < ActiveRecord::Base
	has_many :topics
	has_many :grades, through: :grade_categories
	has_many :grade_categories, dependent: :destroy


	def contents
		contents = []
		self.topics.each do |t|
			t.articles.each do |a|
				a.contents.each do |c|
					contents << c
				end
			end
		end

		return contents
	end
end
