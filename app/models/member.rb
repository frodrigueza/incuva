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

  def self.to_csv
	csv_string = CsvShaper.encode do |csv|
	  csv.headers :name, :age, :gender, :pet_names

	  csv.rows @members do |csv, member|
	    csv.cells :name, :lastname, :email
	  end
	end
  end
end
