class Article < ActiveRecord::Base
	belongs_to :topic
	has_many :contents

	# has_attached_file :content


end
