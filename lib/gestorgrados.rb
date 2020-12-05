#Antonio Cuadros Lapresta
require_relative "horarioasignatura.rb"
require_relative "asignatura.rb"
require_relative "grado.rb"
require_relative "asignaturaerror.rb"
##############################################################################################
#												                                             #
#					Clase GestorGrados					                                     #
#												                                             #
##############################################################################################
class GestorGrados

    def initialize(_dator)
       @dator = _dator
    end

	#####################################################################################
	#
	#Método obtenerGrado
	#
	#####################################################################################
    def obtenerGrado(grado_id)
        return @dator.obtenerGrado(grado_id)
    end

	#####################################################################################
	#
	#Método AñadirGrado
	#
	#####################################################################################
    def AnadirGrado(grado)
		@dator.nuevoGrado(grado)
    end

	#####################################################################################
	#
	#Método eliminarGrado
	#
	#####################################################################################
	def eliminarGrado(grado_id)
		@dator.eliminaGrado(grado_id)
	end
    
end

