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
	def eliminarGrado(nombre)
		i = 0
		encontrado = false
		
        while i < @grados.length() and !encontrado
            if(@grados[i].nombre_grado == nombre)
                encontrado = true
                @grados.delete_at(i)
            end
            i +=1
        end
        
        if !encontrado
            raise AsignaturaError, "Error: No se puede eliminar, no existe el Grado"
        end
	end
    
	#####################################################################################
	#
	#Método obtenerNumGrados
	#
    #####################################################################################
    def obtenerNumGrados()
        return @grados.length()
    end
end

