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
