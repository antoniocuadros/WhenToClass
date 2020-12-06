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
        return grado.id
    end

	#####################################################################################
	#
	#Método eliminarGrado
	#
	#####################################################################################
	def eliminarGrado(grado_id)
		@dator.eliminaGrado(grado_id)
	end

	#####################################################################################
	#
	#Método todosGrados
	#
	#####################################################################################
	def todosGrados()
		return @dator.todosGrados()
	end

	#####################################################################################
	#
	#Método eliminaAsignatura
	#
	#####################################################################################
	def eliminaAsignatura(grado_id, asignatura_id)
		@dator.eliminaAsignatura(grado_id, asignatura_id)
	end

	#####################################################################################
	#
	#Método añadeAsignatura
	#
	#####################################################################################
	def añadeAsignatura(grado_id, asignatura)
		@dator.añadeAsignatura(grado_id, asignatura)
	end


	#####################################################################################
	#
	#Método obtenerAsignatura
	#
	#####################################################################################
	def obtenerAsignatura(grado_id, asignatura_id)
		return @dator.obtenerAsignatura(grado_id, asignatura_id)
	end


	#####################################################################################
	#
	#Método todasAsignaturas
	#
	#####################################################################################
	def todasAsignaturas(grado_id)
		return @dator.todasAsignaturas(grado_id)
	end

	#####################################################################################
	#
	#Método horarioAsignatura
	#
	#####################################################################################
	def horarioAsignatura(grado_id, asignatura_id, grupo)
		asignatura = @dator.obtenerAsignatura(grado_id, asignatura_id)
		horario = asignatura.obtenerHorario(grupo)
		return horario
	end

	#####################################################################################
	#
	#Método enlacesAsignatura
	#
	#####################################################################################
	def enlacesAsignatura(id1, id2, grupo)
		asignatura = @dator.obtenerAsignatura(grado_id, asignatura_id)
		enlaces = asignatura.dameEnlace(grupo)
		return enlaces
	end
end

