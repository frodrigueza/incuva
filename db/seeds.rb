# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Members
Member.create(email: "admin@incuva.cl", password:"adminincuva", :password_confirmation => "adminincuva", is_admin: true, name: "Administrador", lastname: "Incuva")

# categories
Category.create(name: "Matemáticas")
Category.create(name: "Lenguaje")
Category.create(name: "Historia")
Category.create(name: "Física")
Category.create(name: "Biología")
Category.create(name: "Química")

Category.all.each do |c|

	# grades
	12.times do |t|
		c.grades << Grade.create(level: t+1)
	end
end