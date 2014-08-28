class Slide < ActiveRecord::Base
	include ApplicationHelper

	def create_slide(params)
		if file_up = params[:file_up]
			self.image_url = upload_file(file_up)
		end

		if params[:link_url] != ''
			self.link_url = URI(params[:link_url])
			if self.link_url.instance_of?(URI::Generic)
			    self.link_url = URI::HTTP.build({:host => self.link_url.to_s}) 
			end
			self.link_url = self.link_url.to_s	
		end


		self.save
	end
end
