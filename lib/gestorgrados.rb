#Antonio Cuadros Lapresta
require_relative "horarioasignatura.rb"
require_relative "asignaturaerror.rb"
##############################################################################################
#												                                             #
#					Clase GestorGrados					                                     #
#												                                             #
##############################################################################################
class GestorGrados

    def initialize()
        @grados = Array.new
    end

    def obtenerGrado(nombre_grado)
        if @grados.length() == 0
            raise AsignaturaError, "Error: No existe ningún grado disponible"
        else
            for i in 0..@grados.length() -1
                if @grados.nombre_grado == nombre_grado
                    return @grados[i]
            end
            
            raise AsignaturaError, "Error: No se ha encontrado el grado"
        end

end