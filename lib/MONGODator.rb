require_relative "../lib/Dator.rb"
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"
require_relative "../lib/parse.rb"
require 'fileutils'
require 'json'
require 'mongo'

class MONGODator < Dator
    def initialize(env)
        begin
            @client = Mongo::Client.new(env)
            @parse = Parse.new
        rescue
            raise "La variable de entorno de la base de datos no está definida"
        end
        
    end


    #########################
    #
    # Grados
    #
    #########################
    def nuevoGrado(grado)
        if grado.instance_of? Grado            
            a_escribir = @parse.gradoToJSON(grado)

            if (@client[:items].find( { 'id' => grado.id } ).first)
                resultado = @client[:items].update_one(  { 'id' => grado.id }, { '$set' => {
                     'nombre_grado' => grado.nombre_grado,
                     'enlace_grado' =>grado.enlace_grado,
                     'asignaturas' => a_escribir['asignaturas']
                     } })
            else
                resultado = @client[:items].insert_one(a_escribir)
            end
            if !resultado
                raise "Error al añadir a la base de datos"
            end
        else
            raise "Error, objeto pasado como parámetro incorrecto"
        end
    end


    def eliminaGrado(grado_id)
        
        if (@client[:items].find( { 'id' => grado_id } ).first)
            @client[:items].delete_one( { 'id' => grado_id } )
        else #si no existe, excepción
            raise "Error, no existe dicho grado"
        end
    end

    def obtenerGrado(grado_id)
            data = @client[:items].find( { 'id' => grado_id } ).first
            if data
                return @parse.jsonToGrado(JSON.parse(data.to_json))
            else
                raise "Error, no existe dicho grado"
            end

    end

    def todosGrados()
        grados = Array.new
        todos = @client[:items].find()
        
        for i in todos
            grados.push(@parse.jsonToGrado(JSON.parse(i.to_json)))
        end
        return grados
    end

    #########################
    #
    # Asignaturas
    #
    #########################

    def eliminaAsignatura(grado_id, asignatura_id)
        if (data = @client[:items].find( { 'id' => grado_id } ).first)
            begin
                grado = @parse.jsonToGrado(JSON.parse(data.to_json))
                grado.eliminarAsignatura_id(asignatura_id)
                nuevoGrado(grado)
            rescue
                raise "No se ha podido eliminar, no existe la asignatura"
            end
                
        else
            raise "No se ha podido eliminar, no existe el grado"
        end
    end


    def añadeAsignatura(grado_id, asignatura)
        data = @client[:items].find( { 'id' => grado_id } ).first
        if  data
            grado = @parse.jsonToGrado(JSON.parse(data.to_json))
            grado.anadirAsignatura(asignatura)
            nuevoGrado(grado)
        else
            raise "No existe el grado"
        end
    end


    def obtenerAsignatura(grado_id, asignatura_id)
        if (data = @client[:items].find( { 'id' => grado_id } ).first)
            begin
                grado = @parse.jsonToGrado(JSON.parse(data.to_json))
                asig = grado.obtenerAsignatura_id(asignatura_id)
                return asig
            rescue
                raise "No se ha podido eliminar, no existe la asignatura"
            end
                
        else
            raise "No se ha podido eliminar, no existe el grado"
        end
    end

    def todasAsignaturas(grado_id)
        if (data = @client[:items].find( { 'id' => grado_id } ).first)
            begin
                grado = @parse.jsonToGrado(JSON.parse(data.to_json))
                asig = grado.asignaturas
                return asig
            rescue
                raise "No se ha podido eliminar, no existe la asignatura"
            end
                
        else
            raise "No se ha podido eliminar, no existe el grado"
        end
    end
end