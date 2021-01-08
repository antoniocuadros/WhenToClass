require 'rack'
require 'fileutils'

module Rack    
    class CustomLogger
        def initialize(app)
            @app = app
        end
        def call(env)
            # En primer lugar obtenemos:
            #   El estado de la operación
            #   Los headers de la request
            #   El cuerpo
            # Para posteriormente devolverlos

            status, headers, body = @app.call(env)
          
            fecha = Time.now.strftime("%d_%m_%Y")

                       #Metodo(get,post...)  Ruta(/loquesea)                         Version http
            if !env[QUERY_STRING].empty?
                query_s = "?" + env[QUERY_STRING]
            else
                query_s = ""
            end
            hora = Time.now.strftime("%H:%M:%S")

            log = fecha.to_s + " " + hora + " " + env[REQUEST_METHOD].to_s + " " + env[PATH_INFO].to_s + query_s + " " + env[SERVER_PROTOCOL].to_s + " " + status.to_s[0..3]

            p log

            #Enviamos la respuesta
            [status, headers, body]
        end
    end
end