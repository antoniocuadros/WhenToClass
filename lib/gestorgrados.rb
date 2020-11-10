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

    def initialize(grados = nil)
        if(grados != nil)
            num_grados = grados.length()

            for i in 0..num_grados-1
                @grados = Array.new
                @grados.push(grados[i])
            end
        else
            @grados = Array.new
        end
    end

	#####################################################################################
	#
	#Método obtenerGrado
	#
	#####################################################################################
    def obtenerGrado(nombre_grado)
        if @grados.length() == 0
            raise AsignaturaError, "Error: No existe ningún grado disponible"
        else
            for i in 0..@grados.length() -1
                if @grados[i].nombre_grado == nombre_grado
                    return @grados[i]
                end
            end

            raise AsignaturaError, "Error: No se ha encontrado el grado"
        end
    end

	#####################################################################################
	#
	#Método AñadirGrado
	#
	#####################################################################################
    def AnadirGrado(grado)
		if(grado.instance_of? Grado)
			@grados << grado
		else
			raise AsignaturaError, "Error: No se puede añadir, no es un objeto Grado"
		end
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
