class Download < ActiveRecord::Base
	belongs_to :member
	belongs_to :content

	
end
