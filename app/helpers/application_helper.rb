module ApplicationHelper
	def interest_areas
		array = [
			'Educación de Párvulos',
			'Educación Diferencial',
			'Pedagogía General Básica ',
			'Pedagogía en Educación Media - Matemática',
			'Pedagogía en Educación Media - Lenguaje y Comunicación ',
			'Pedagogía en Educación Media - Historia, Geografía y Ciencias Sociales ',
			'Pedagogía en Educación Media - Biología',
			'Pedagogía en Educación Media - Física',
			'Pedagogía en Educación Media - Química' ,
			'Pedagogía en Educación Media - Filosofía ',
			'Pedagogía en Artes Visuales ',
			'Pedagogía en Artes Musicales ',
			'Pedagogía en Inglés',
			'Pedagogía en Educación Fisica',
			'Otra pedagogía',
			'Orientación Vocacional'
		]
	end

	def zones
		array = [
			'I Región',
			'II Región',
			'III Región',
			'IV Región',
			'V Región',
			'VI Región',
			'VII Región',
			'VIII Región',
			'IX Región',
			'X Región',
			'XI Región',
			'XII Región',
			'Región Metropolitana de Santiago',
			'XIV Región',
			'XV Región'
		]
	end
	def school_dependences
		array = [
			'Particular subvencionado',
			'Particular pagado',
			'Municipalizado'
		]
	end

	def content_types
		array = [
			'Videos',
			'Infografías',
			'Cartas al director',
			'Columnas',
			'Estudios',
			'Noticias',
			'Publicidad',
			'Presentaciones'
		]
		
	end

	def content_type_name(i)
		case i.to_i
			when 1
				return 'Videos'
			when 2
				return 'Infografías'
			when 3
				return 'Cartas al director'
			when 4
				return 'Columnas'
			when 5
				return 'Estudios'
			when 6
				return 'Noticias'
			when 7
				return 'Publicidad'
			when 8
				return 'Presentaciones'
		end
	end

	def content_name_type(name)
		case name.to_s
			when 'Videos'
				return 1
			when 'Infografias'
				return 2
			when 'Cartas_al_director'
				return 3
			when 'Columnas'
				return 4
			when 'Estudios'
				return 5
			when 'Noticias'
				return 6
			when 'Publicidad'
				return 7
			when 'Presentaciones'
				return 8
		end
		
	end

	def upload_file(file_up)
		container = WAZ::Blobs::Container.find('contents')
		filename = rand(36**32).to_s(36) + File.extname(file_up.original_filename)
		container.store(filename, file_up.read, file_up.content_type)
		
		return container[filename].url
	end
end
