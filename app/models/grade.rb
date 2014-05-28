class Grade < ActiveRecord::Base
	belongs_to :category
	has_many :topics, dependent: :destroy

	def f_level
		case self.level.to_s
			when '1'
				return '1ero Básico'
			when '2'
				return '2do Básico'
			when '3'
				return '3ero Básico'
			when '4'
				return '4to Básico'
			when '5'
				return '5to Básico'
			when '6'
				return '6to Básico'
			when '7'
				return '7mo Básico'
			when '8'
				return '8vo Básico'
			when '9'
				return 'I Medio'
			when '10'
				return 'II Medio'
			when '11'
				return 'III Medio'
			when '12'
				return 'IV Medio'
		end
	end

	
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
