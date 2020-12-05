require_relative "../lib/Dator.rb"
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"
require 'json'



class Parse
    def initialize()
    end

    def asignaturaToJSON(asignatura)
        #obtenemos el horario de teoría en formato JSON
        horario_teoria = {
            "dia" => asignatura.horario_teoria.dia,
            "hora_inicio" => asignatura.horario_teoria.hora_inicio,
            "hora_fin" => asignatura.horario_teoria.hora_fin,
            "grupo" => asignatura.horario_teoria.grupo
        }
        #Obtenemos el horario de prácticas en formato JSON
        horarios_practicas = Array.new
        for j in 0..asignatura.horario_practicas.length()-1
            horario_practicas = {
                "dia" => asignatura.horario_practicas[j].dia,
                "hora_inicio" => asignatura.horario_practicas[j].hora_inicio,
                "hora_fin" => asignatura.horario_practicas[j].hora_fin,
                "grupo" => asignatura.horario_practicas[j].grupo
            }
            horarios_practicas.push(horario_practicas)
        end

        #rellenamos los datos de la asignatura
        asignatura = {
            "id"=> asignatura.id,
            "siglas"=> asignatura.siglas,
            "nombre"=> asignatura.nombre,
            "horario_teoria"=> horario_teoria,
            "horario_practicas"=> horarios_practicas,
            "turno_presencialidad"=> asignatura.turno_presencialidad,
            "grupo"=> asignatura.grupo,
            "enlaces_clase_online"=> asignatura.enlaces_clase_online,
            "curso"=> asignatura.curso
        }
        return asignatura
    end

    def gradoToJSON(grado)
        asignaturas = Array.new
        for i in 0..grado.asignaturas.length()-1
            asignatura = asignaturaToJSON(grado.asignaturas[i])

             asignaturas.push(asignatura)
         end
        
        grado = {
            "id"=> grado.id,
            "asignaturas"=> asignaturas,
            "nombre_grado"=> grado.nombre_grado,
            "enlace_grado"=> grado.enlace_grado
        }
        return grado
    end

    def jsonToAsignatura(asignatura)
            #recuperamos el horario de teoria
            horario_teoria = HorarioAsignatura.new(asignatura['horario_teoria']['dia'],asignatura['horario_teoria']['hora_inicio'] , asignatura['horario_teoria']['hora_fin'],asignatura['horario_teoria']['grupo'] )

            #recuperamos los horarios de prácticas
            array_practicas = Array.new
            for j in 0..asignatura['horario_practicas'].length()-1
                horario_pr = HorarioAsignatura.new(asignatura['horario_practicas'][j]['dia'] ,asignatura['horario_practicas'][j]['hora_inicio'] , asignatura['horario_practicas'][j]['hora_fin'],asignatura['horario_practicas'][j]['grupo'])
                array_practicas.push(horario_pr)
            end
            #recuperamos los datos
            idA = asignatura['id']
            siglasA = asignatura['siglas']
            nombreA = asignatura['nombre']
            horario_teoriaA = horario_teoria
            horario_practicasA = array_practicas
            turno_presencialidadA = asignatura['turno_presencialidad']
            grupoA = asignatura['grupo']
            enlaces_clase_onlineA = asignatura['enlaces_clase_online']
            cursoA = asignatura['curso']

            asignatura = Asignatura.new(nombreA, horario_teoriaA, horario_practicasA, grupoA, turno_presencialidadA, enlaces_clase_onlineA, cursoA, siglasA, idA)
            return asignatura
    end
    
    def jsonToGrado(grado)
        # Datos del grado
        id = grado['id']
        nombre_grado = grado['nombre_grado']
        asignaturas = grado['asignaturas']
        enlace_grado = grado['enlace_grado']

        array_asignaturas = Array.new
        for i in 0.. asignaturas.length()-1
            asignatura = jsonToAsignatura(asignaturas[i])
            array_asignaturas.push(asignatura)
        end

        grado_a_devolver = Grado.new(nombre_grado, enlace_grado,  array_asignaturas, id)
        return grado_a_devolver
    end

end