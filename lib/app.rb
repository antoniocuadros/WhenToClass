require "roda"

class App < Roda
    ####################
    #Plugins
    plugin :all_verbs #por defecto solo trae GET y POST, queremos más.
    
    ####################
    #Rutas
    route do |r|
        #Directorio Raíz
        r.root do
            "/"
        end

        # /grados
        r.on "grados" do
            # GET /grados
            r.get do
                "obtener todos los grados"
            end
        end

        # /grado
        r.on "grado" do
            # /grado/$ID
            r.on /[a-f0-9]{20}/ do |id|
                r.on "asignaturas" do
                    r.get do
                        "obtener las asignaturas del grado"
                    end
                end
                r.get do
                    "obtener información del grado"
                end

                r.delete do
                    "eliminar el grado"
                end

                r.post do
                    "añadir grado"
                end
            end
        end

        # /asignatura
        r.on "asignatura" do
            r.on /[a-f0-9]{20}/ do |id|
                # /asignatura/$ID/horario
                r.get "horario" do
                    "obtener el horario de la asignatura"
                end

                # /asignatura/$ID/turnos
                r.get "turnos" do
                    "obtener los turnos de la asignatura"
                end
            end
        end

    end
end