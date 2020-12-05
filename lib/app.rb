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

            end
        end


    end
end