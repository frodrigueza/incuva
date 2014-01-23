class Notice < ActiveRecord::Base
	def f_date
		date = self.created_at.strftime("%d %B %Y")
		date.sub! 'January','Enero'
		date.sub! 'February','Febrero'
		date.sub! 'March','Marzo'
		date.sub! 'April','Abril'
		date.sub! 'May','Mayo'
		date.sub! 'June','Junio'
		date.sub! 'July','Julio'
		date.sub! 'August','Agosto'
		date.sub! 'September','Septiembre'
		date.sub! 'October','Octubre'
		date.sub! 'November','Noviembre'
		date.sub! 'December','Diciembre'

		return date
	end
end
