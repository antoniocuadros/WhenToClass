require_relative "asignaturaerror.rb"
require_relative "horarioasignatura.rb"
require_relative "asignatura.rb"
require_relative "gestorasignatura.rb"

##############################################################################################
#												                                             #
#					Clase grado				                                                 #
#												                                             #
##############################################################################################

class Grado
	attr_reader:nombre_grado
	attr_reader:asignaturas
	attr_reader:enlace_grado

	def initialize(nombre_grado, asignaturas, enlace_grado)
		
	end

end