#Antonio Cuadros Lapresta
require_relative "horarioasignatura.rb"
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

    def obtenerGrado(nombre_grado)
        if @grados.length() == 0
            raise AsignaturaError, "Error: No existe ningún grado disponible"
        else
            for i in 0..@grados.length() -1
                if @grados.nombre_grado == nombre_grado
                    return @grados[i]
                end
            end

            raise AsignaturaError, "Error: No se ha encontrado el grado"
        end
    end

end