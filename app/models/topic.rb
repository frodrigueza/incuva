class Topic < ActiveRecord::Base
	belongs_to :category
	has_many :articles, dependent: :destroy
	belongs_to :grade


	def contents
		contents = []
		self.articles.each do |a|
			a.contents.each do |c|
				contents << c
			end
		end

		return contents
	end
end
