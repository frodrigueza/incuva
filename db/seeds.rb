# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Members
Member.create(email: "admin@incuva.cl", password:"adminincuva", :password_confirmation => "adminincuva", is_admin: true, name: "Administrador", lastname: "Incuva")
Member.create(email: "visita@incuva.cl", password:"visitaincuva", :password_confirmation => "visitaincuva", is_admin: true, name: "Visita", lastname: "Incuva")

# grades
12.times do |t|
	Grade.create(level: t+1)
end
# categories
Category.create(name: "Matematicas")
Category.create(name: "Lenguaje")
Category.create(name: "Historia")
Category.create(name: "Fisica")
Category.create(name: "Biologia")
Category.create(name: "Quimica")

# topics
Topic.create(title: "Algebra")

# articles
Article.create(level: 1, title: "Productos Notables")
Article.create(level: 1, title: "Factorizaciones")
Article.create(level: 1, title: "Fracciones Algebraicas")

Grade.all.each do |g|
	Category.all.each do |c|
		g.categories << c
	end
end

Topic.all.each do |t|
	Category.first.topics << t
	Grade.find(9).topics << t
end

Article.all.each do |a|
	Topic.first.articles << a
end

Content.all.each do |c|
	Article.first.contents << c
end