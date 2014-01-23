class Content < ActiveRecord::Base
	belongs_to :article

	def image

		if self.extension == 'pdf'
			return "file.png"
		elsif self.extension == 'mp3'
			return "music_icon.png"
		elsif self.extension == 'mp4'
			return "video.png"
		elsif self.extension == 'jpg'
			return "image.png"
		elsif self.extension == 'rar'
			return "compressed.png"
		elsif self.extension == 'ppt'
			return "powerpoint.png"
		else
			return "file.png"
		end
		
	end

	def upload_content(params)

		
  		self.name = params[:name]
		if file_up = params[:content_file]
			# subida desde el PC
			container = WAZ::Blobs::Container.find('contents')
			filename = rand(36**32).to_s(36) + File.extname(file_up.original_filename)
			container.store(filename, file_up.read, file_up.content_type)
			self.url = container[filename].url
			self.source = params[:source]

		else
			# subido desde URL
			self.url = params[:url]
			self.source = URI.parse(url).host
		end

		self.extension = params[:extension]
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
