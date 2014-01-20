class Content < ActiveRecord::Base
	belongs_to :article

	has_attached_file :note

	def image
		# if self.content_type == 1
		# 	return "file.png"
		# elsif self.content_type == 2
		# 	return "music.png"
		# elsif self.content_type == 4
		# 	return "powerpoint.png"
		# end

		'file.png'
	end

	def upload_content(params)

		# vemos si se subio un archivo o un link
		if file_up = params[:content_file]
			container = WAZ::Blobs::Container.find('contents')
			filename = rand(36**32).to_s(36) + File.extname(file_up.original_filename)
			container.store(filename, file_up.read, file_up.content_type)
			self.url = container[filename].url
		else
			self.url = params[:url]
		end
		Article.find(params[:article_id]).contents << self
	end

	def delete_blob
		container = WAZ::Blobs::Container.find('contents')

		
		if self.url
			if container[self.url.split('/').last]
				container[self.url.split('/').last].destroy!
			end
		end
	end
end
