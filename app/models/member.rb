class Member < ActiveRecord::Base
  has_many :downloads

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def f_name
  	if self.name && self.lastname
	  	return self.name + " " + self.lastname
	  end
  end

  def update_fields(params)
  	params[:school_dependence] != '' ? self.school_dependence = params[:school_dependence] : true
  	params[:interest_area] != '' ? self.interest_area = params[:interest_area] : true
  	params[:zone] != '' ? self.zone = params[:zone] : true
  	params[:phone] != '' ? self.phone = params[:phone] : true
  	self.save
  end

  def new_download(content_id)
    content = Content.find(content_id)
    if self.downloads.where(content_id: content_id).count == 0
      d = Download.create()
      self.downloads << d
      content.downloads << d
    else
      d = self.downloads.where(content_id: content_id).first
      d.download_times += 1
      d.save
    end
  end

  comma do 

  	name
  	lastname
  	email
  	zone
  	school_dependence
  	interest_area
  	phone
  	
  end
end
