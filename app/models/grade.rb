class Grade < ActiveRecord::Base
	has_many :categories, through: :grade_categories
	has_many :grade_categories, dependent: :destroy
	has_many :topics, dependent: :destroy

	def f_level
		case self.level.to_s
			when '1'
				return '1ero Basico'
			when '2'
				return '2do Basico'
			when '3'
				return '3ero Basico'
			when '4'
				return '4to Basico'
			when '5'
				return '5to Basico'
			when '6'
				return '6to Basico'
			when '7'
				return '7mo Basico'
			when '8'
				return '8vo Basico'
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
end
