
class Dator
    def initialize()
        if (self.initialize == Dator)
            raise  "Clase no instanciable"
        end
    end
    
    #########################
    #
    # Grados
    #
    #########################
    def nuevoGrado(grado)
        raise  "Hay que implementar el método"
    end


    def eliminaGrado(grado_id)
        raise  "Hay que implementar el método"
    end

    def obtenerGrado(grado_id)
        raise  "Hay que implementar el método"
    end

    #########################
    #
    # Asignaturas
    #
    #########################

    def eliminaAsignatura(grado_id, asignatura_id)
        raise  "Hay que implementar el método"
    end

    def añadeAsignatura(grado_id, asignatura)
        raise  "Hay que implementar el método"
    end

    def obtenerAsignatura(grado_id, asignatura_id)
        raise  "Hay que implementar el método"
    end
end