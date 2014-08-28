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

	def content_type_description(i)
		case i.to_i
			when 1
				return 'Este material audiovisual de Elige Educar lo puedes utilizar para analizar el mensaje explícito e implícito, la efectividad como herramienta audiovisual, las funciones del lenguaje presentes, y todo lo que consideres importante para sacarle provecho en tus clases'
			when 2
				return 'En esta sección hay información variada, presentada de diferentes maneras. Puedes analizarla desde lo que informa, cómo lo informa, las ideas fuerza presentes, si hace llamado a la acción, las impresiones como receptor, o el objetivo de difundir material infográfico. ¡Sácale provecho al análisis de estas imágenes en tus clases!'
			when 3
				return 'Acá podrás encontrar opiniones al respecto de temáticas específicas de educación, donde puedes analizar el discurso, los argumentos, los puntos de vista, y contrastarlo con opiniones al respecto, u otras cartas de la misma materia o de otros ámbitos, para desarrollar capacidades con tus estudiantes.'
			when 4
				return 'Al igual que las cartas, las columnas de opinión muestran puntos de vista con una extensión mayor, lo que permite profundizar en los argumentos, por lo que hay posibilidades de analizar en profundidad lo que se plantea en este tipo de texto. Además puedes fomentar en los estudiantes que opinen al respecto y diseñen sus propios argumentos.'
			when 5
				return 'Acá hay documentos y propuestas realizadas con profundidad por Elige Educar, específicamente sobre docentes, su formación, su desarrollo profesional, y el "mercado" en el que se mueve. Tal vez exista información compleja. pero hay mucho material gráfico que puede ser rico de analizar.'
			when 6
				return 'En esta sección existe material de prensa en formato radial, en periódicos (impresos y virtuales), y en televisión. Puedes analizar el contenido de la noticia, la forma en que se presenta, el tipo de interacción de la información y la manera de obtenerla o presentarla, y opinar al respecto.'
			when 7
				return '¿Cuál crees que es el objetivo de estas publicidades? ¿A quién va dirigido el mensaje? ¿Qué busca provocar en el receptor? ¿Es original? ¿Es visualmente atractivo? ¿Que aporta la música a la emotividad del contenido? Todas estas respuestas pueden desarrollarse desde diversas asignaturas. Te invitamos a utilizarlos.'
			when 8
				return 'Algunos PPT con información que podrían analizar desde la lógica de los gráficos, y el desarrollo de las temáticas gracias al  impacto de las acciones realizadas por Elige Educar.'
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
