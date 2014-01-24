class Notice < ActiveRecord::Base
	def f_date
		date = self.created_at.strftime("%d %B %Y")
		date.sub! 'January','Ene'
		date.sub! 'February','Feb'
		date.sub! 'March','Mar'
		date.sub! 'April','Abr'
		date.sub! 'May','May'
		date.sub! 'June','Jun'
		date.sub! 'July','Jul'
		date.sub! 'August','Ago'
		date.sub! 'September','Sep'
		date.sub! 'October','Oct'
		date.sub! 'November','Nov'
		date.sub! 'December','Dic'

		return date
	end
end
