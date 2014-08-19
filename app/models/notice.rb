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

	def f_create(params)
  		self.title = params[:notice][:title]
  		self.body = params[:notice][:body]
  		self.link_url = params[:notice][:link_url]

		if file_up = params[:notice][:file_up]
			# subida desde el PC
			container = WAZ::Blobs::Container.find('contents')
			filename = rand(36**32).to_s(36) + File.extname(file_up.original_filename)
			container.store(filename, file_up.read, file_up.content_type)
			self.image_url = container[filename].url
		end

	end
end
