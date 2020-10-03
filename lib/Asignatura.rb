#Antonio Cuadros Lapresta

class Asignatura
	#Métodos get
	attr_reader:nombre
	attr_reader:horario_teoria 		#será un struct con dia, hora inicio, hora fin
	attr_reader:horario_practicas  	#será un struct con dia, hora inicio, hora fin
	attr_reader:turno_presencialidad 	#Matriz con el la primera columna los 
						#grupos 1, 2 y resto de columnas los días de 
						#cada grupo
	
	def initialize(nombre_asignatura, h_teoria, h_practicas, group, t_presencialidad)
		@nombre = nombre_asignatura
		@horario_teoria = h_teoria
		@horario_practicas = h_practicas
		@grupo = group
		@turno_presencialidad = t_presencialidad
	end
	
	#Método que devuelve los días y hora a los que hay que ir tanto a teoría como prácticas
	def obtenerHorario()
	
	end
	
	#Método que dado un turno de presencialidad devuelve que días corresponden ir
	def obtenerDiasPresenciales(turno)
	
	end
end
