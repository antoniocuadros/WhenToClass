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
    end
end