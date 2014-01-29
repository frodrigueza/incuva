class Article < ActiveRecord::Base
	belongs_to :topic
	has_many :contents, dependent: :destroy

	before_destroy :delete_contents_blobs

	private

	def delete_contents_blobs
		self.contents.each do |c|
			c.delete_blob
		end
	end

end
