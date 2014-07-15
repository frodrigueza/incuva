class Member < ActiveRecord::Base
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
