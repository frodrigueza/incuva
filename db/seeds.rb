# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# grades
12.times do |t|
	Grade.create(level: t+1)
end
# categories
Category.create(name: "Matematicas")
Category.create(name: "Lenguaje")
Category.create(name: "Historia")
Category.create(name: "Ingles")
Category.create(name: "Fisica")
Category.create(name: "Biologia")
Category.create(name: "Quimica")
Category.create(name: "Religion")

# topics
Topic.create(title: "Algebra")
Topic.create(title: "Calculo")
Topic.create(title: "Estadistica")
Topic.create(title: "Geometria analitica")

# articles
Article.create(level: 1, title: "Productos Notables" , description: "Se trata de hacer entender al alumno la escencia de lo que son los productos notables")
Article.create(level: 1, title: "Factorizaciones" , description: "Se trata de ahondar en los tipos de productos notables mas complejos")
Article.create(level: 1, title: "Fracciones Algebraicas" , description: "Ejercicios básicos y explicativos de productos notables")

# contents
Content.create(name: "Introduccion")

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