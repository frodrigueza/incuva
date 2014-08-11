class Category < ActiveRecord::Base
	has_many :topics
	has_many :grades, dependent: :destroy


	def contents
		contents = []
		self.grades.each do |g|
			g.topics.each do |t|
				t.articles.each do |a|
					a.contents.each do |c|
						contents << c
					end
				end
			end
		end

		return contents
	end
end
