class Content < ActiveRecord::Base
	belongs_to :article
	has_many :downloads

	def image
		if self.extension == 'pdf'
			return "contents/file.png"
		elsif self.extension == 'mp3'
			return "contents/music_icon.png"
		elsif self.extension == 'mp4'
			return "contents/video.png"
		elsif self.extension == 'jpg'
			return "contents/image.png"
		elsif self.extension == 'rar'
			return "contents/compressed.png"
		elsif self.extension == 'ppt'
			return "contents/presentacion.png"
		else
			return "contents/file.png"
		end
		
	end

	def content_class
		if self.extension == 'pdf' || self.extension == 'ppt'
			return "fancybox iframe"
		elsif self.extension == 'jpg'
			return "fancybox"
		elsif self.extension == 'mp4'
			return "fancybox-video"
		elsif self.extension == 'link'
			return "link"
		else
			return ''
		end

	end

	def preview_image
		if self.preview_image_url
			self.preview_image_url
		else
			'elige_educar.jpg'
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

		if file_up = params[:content_file_2]
			# imagen a previsualizar
			container = WAZ::Blobs::Container.find('contents')
			filename = rand(36**32).to_s(36) + File.extname(file_up.original_filename)
			container.store(filename, file_up.read, file_up.content_type)
			self.preview_image_url = container[filename].url
		end

		self.extension = params[:extension]
		if params[:article_id] != '-1'
			Article.find(params[:article_id]).contents << self
		else
			self.content_type = params[:content_type]
			self.description = params[:description]
		end

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
