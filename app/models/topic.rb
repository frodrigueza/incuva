class Topic < ActiveRecord::Base
	belongs_to :category
	has_many :articles, dependent: :destroy
	belongs_to :grade
end
