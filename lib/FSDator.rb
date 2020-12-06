require_relative "../lib/Dator.rb"
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"
require_relative "../lib/parse.rb"
require 'fileutils'
require 'json'


class FSDator < Dator
    def initialize(ruta)
        if (! Dir.exist?(ruta))     #no existe la ruta que se nos ha pasado
            FileUtils.mkdir ruta    #creamos la carpeta
        end
        @carpeta = ruta
        @parse = Parse.new
    end


    #########################
    #
    # Grados
    #
    #########################
    def nuevoGrado(grado)
        if grado.instance_of? Grado
            ruta_para_grado = @carpeta + "/" + grado.id #se crea una carpeta con la id
            FileUtils.mkdir ruta_para_grado
            FileUtils.touch @carpeta + "/" + grado.id + "/info.json" #creamos el archivo con la información
            
            a_escribir = @parse.gradoToJSON(grado)

            File.open(@carpeta + "/" + grado.id + "/info.json", 'w') { |file| file.write(a_escribir.to_json) }
        else
            raise "Error, objeto pasado como parámetro incorrecto"
        end
    end


    def eliminaGrado(grado_id)
        a_eliminar = @carpeta + "/" + grado_id
        if Dir.exist?(a_eliminar) #si existe el directorio lo borramos
            FileUtils.rm_rf a_eliminar
        else #si no existe, excepción
            raise "Error, no existe dicho grado"
        end
    end

    def obtenerGrado(grado_id)
        a_consultar = @carpeta + "/" + grado_id + "/info.json"
        if File.exist?(a_consultar)
            data =  File.read(a_consultar)
            return @parse.jsonToGrado(JSON.parse(data))
        else
            raise "Error, no existe dicho grado"
        end
    end

    def todosGrados()
        grados = Array.new
        busqueda = @carpeta+"/*"
        array_dir_grados = Dir.glob(busqueda) #devuelve un array de la forma data/id,data/id2...
        for i in 0..array_dir_grados.length()-1
            grados.push(obtenerGrado(array_dir_grados[i].split('/')[1]))
        end
        return grados
    end

    #########################
    #
    # Asignaturas
    #
    #########################

    def eliminaAsignatura(grado_id, asignatura_id)
        carpeta_grado = @carpeta + "/" + grado_id
        archivo = carpeta_grado + "/info.json"
        
        #Comprobamos si existe el archivo
        if File.exist?(archivo)
            data = File.read(archivo)
            grado = @parse.jsonToGrado(JSON.parse(data))
         
            encontrado = false
            for i in 0..grado.asignaturas.length()-1
                if asignatura_id == grado.asignaturas[i].id
                    nombre = grado.asignaturas[i].nombre
                    grado.eliminarAsignatura(nombre)
                    encontrado = true
                end
            end
            if (encontrado)
                a_escribir = @parse.gradoToJSON(grado)
                File.open(@carpeta + "/" + grado_id + "/info.json", 'w') { |file| file.write(a_escribir.to_json) }
            else
                raise  "No se ha encontrado la asignatura"
            end
            
        else
            raise  "No se ha encontrado el grado"
        end

    end


    def añadeAsignatura(grado_id, asignatura)
        carpeta_grado = @carpeta + "/" + grado_id
        archivo = carpeta_grado + "/info.json"
        if  File.exist?(archivo)
            data = File.read(archivo)
            grado = @parse.jsonToGrado(JSON.parse(data))
            grado.anadirAsignatura(asignatura)
            a_escribir = @parse.gradoToJSON(grado)
            File.open(@carpeta + "/" + grado_id + "/info.json", 'w') { |file| file.write(a_escribir.to_json) }
        else
            raise "No existe el grado"
        end
    end


    def obtenerAsignatura(grado_id, asignatura_id)
        carpeta_grado = @carpeta + "/" + grado_id
        archivo = carpeta_grado + "/info.json"
        if  File.exist?(archivo)
            data = File.read(archivo)
            grado = @parse.jsonToGrado(JSON.parse(data))

            encontrado = false
            for i in 0..grado.asignaturas.length()-1
                if asignatura_id == grado.asignaturas[i].id
                    asignatura = grado.asignaturas[i]
                    encontrado = true
                end
            end
            if (encontrado)
                p asignatura
                return asignatura
            else
                raise  "No se ha encontrado la asignatura"
            end
        else
            raise "No existe el grado"
        end
    end
end

dator = FSDator.new("data")
dator.todosGrados()