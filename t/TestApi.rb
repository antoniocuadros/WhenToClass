require "minitest/autorun"
require "minitest/mock"
require "rack/test"
require "fileutils"

require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"
require_relative "../lib/FSDator.rb"
require_relative "../lib/app.rb"

class TestApi < Minitest::Test
    include Rack::Test::Methods
    def setup
        @grado = {"id"=>"0e78a27a1e605334c0ba","asignaturas"=>[{"id"=>"50bbd28fa87ba567f7bd","siglas"=>"IV","nombre"=>"Infraestructura Virtual","horario_teoria"=>{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"},"horario_practicas"=>[{"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"},{"dia"=>"5-Viernes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P2"}],"turno_presencialidad"=>[["28sep - 2oct","12oct - 16oct","26oct - 30oct","9nov - 13nov","23nov - 27nov","7dec - 11dec","21dec - 22dec"],["5oct - 9oct","19oct - 23oct","2nov - 6nov","16nov - 20nov","30nov - 4dec","14dec - 18dec","8jan y 11jan - 14jan"]],"grupo"=>"A","enlaces_clase_online"=>["https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020"],"curso"=>"4"}],"nombre_grado"=>"Ingeniería Informática","enlace_grado"=>"https://grados.ugr.es/informatica/"}
        @asignatura = {"id"=>"50bbd28fa87ba567f7bd","siglas"=>"IV","nombre"=>"Infraestructura Virtual","horario_teoria"=>{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"},"horario_practicas"=>[{"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"},{"dia"=>"5-Viernes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P2"}],"turno_presencialidad"=>[["28sep - 2oct","12oct - 16oct","26oct - 30oct","9nov - 13nov","23nov - 27nov","7dec - 11dec","21dec - 22dec"],["5oct - 9oct","19oct - 23oct","2nov - 6nov","16nov - 20nov","30nov - 4dec","14dec - 18dec","8jan y 11jan - 14jan"]],"grupo"=>"A","enlaces_clase_online"=>["https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020"],"curso"=>"4"}
    end

    def app
        App
    end
    
    def test_raiz_ok
        get '/'    
            res = '{"status":"OK"}'
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    def test_status
        get '/status'    
            res = '{"status":"OK"}'
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para añadir grado
	#
	#método: añadir grado en el microservicio
	#HU10
	#####################################################################################
    #Test 1: añade correctamente
    def test_anadir_grado_ok
        a_anadir = @grado
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    
            res = {"añadido"=>"0e78a27a1e605334c0ba"}
            res = res.to_json
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end



    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para eliminar grado
	#
	#método: eliminar grado en el microservicio
	#HU10
	#####################################################################################
    #Test 1: Eliminar correctamente
    def test_eliminar_grado_ok
        a_anadir = @grado
        #Añadimos para poder borrar
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a borrar
        delete '/grado/0e78a27a1e605334c0ba' 
            res = {"eliminado"=>"0e78a27a1e605334c0ba"}
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #Test 2: Eliminar falla si no existe lo que se quiere borrar
    def test_eliminar_grado_falla
        delete '/grado/123' 
            res = {"error"=>"No existe el grado"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para consultar grado
	#
	#método: consultar grado en el microservicio
	#HU10
    #####################################################################################
    #Test 1: Se consulta correctamente
    def test_consultar_grado_ok
        a_anadir = @grado
        #Añadimos para poder consultar
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar
        get '/grado/0e78a27a1e605334c0ba' 
            res = a_anadir
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 2: Se consulta erroneamente
    def test_consultar_grado_falla
        #Probamos a consultar
        get '/grado/0e78a27a1e605334c0ba' 
            res = {"error"=>"No existe el grado"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para añadir asignatura
	#
	#método: añadir asignatura en el microservicio
	#HU4
    #####################################################################################
    #Test 1: se obtiene la asignatura correctamente
    def test_consultar_asignatura_ok
        a_anadir = @grado
        #Añadimos para poder consultar
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd' 
            res = @asignatura
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 3: se obtiene la asignatura erroneamente
    def test_consultar_asignatura_falla
        #Probamos a consultar
        get '/grado/0e78a27a1e605334c0ba/asignatura/123' 
            res = {"error"=>"No existe el grado o la asignatura"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para eliminar asignatura
	#
	#método: eliminar asignatura en el microservicio
	#HU4
    #####################################################################################
    #Test 1: Se elimina la asignatura correctamente
    def test_elimina_asignatura_ok
        a_anadir = @grado
        #Añadimos para poder eliminar
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a eliminar
        delete '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd' 
            res = {"eliminado"=>"50bbd28fa87ba567f7bd"}
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 2: Se elimina la asignatura erroneamente
    def test_elimina_asignatura_falla
        #Probamos a eliminar
        delete '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd' 
            res = {"error"=>"No existe el grado o la asignatura"}
            res = res.to_json
            assert_equal last_response.status, 404 
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para añadir asignatura
	#
	#método: añadir asignatura en el microservicio
	#HU4
    #####################################################################################
    def test_añade_asignatura_ok
        a_anadir = {"id"=>"0e78a27a1e605334c0ba","asignaturas"=>[],"nombre_grado"=>"Ingeniería Informática","enlace_grado"=>"https://grados.ugr.es/informatica/"}
        #Añadimos grado para poder añadir asignaturas
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a añadir
        a_anadir = {"id"=>"50bbd28fa87ba567f7bd","siglas"=>"IV","nombre"=>"Infraestructura Virtual","horario_teoria"=>{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"},"horario_practicas"=>[{"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"},{"dia"=>"5-Viernes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P2"}],"turno_presencialidad"=>[["28sep - 2oct","12oct - 16oct","26oct - 30oct","9nov - 13nov","23nov - 27nov","7dec - 11dec","21dec - 22dec"],["5oct - 9oct","19oct - 23oct","2nov - 6nov","16nov - 20nov","30nov - 4dec","14dec - 18dec","8jan y 11jan - 14jan"]],"grupo"=>"A","enlaces_clase_online"=>["https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020"],"curso"=>"4"}
        put '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd', a_anadir.to_json 
            res = {"añadido"=>"50bbd28fa87ba567f7bd"}
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 2: falla al añadir asignatura
    def test_añade_asignatura_falla
        #Probamos a añadir
        a_anadir = @asignatura
        put '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd', a_anadir.to_json 
            res = {"error"=>"No existe el grado o la asignatura"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para obtener horario asignatura
	#
	#método: obtener horario asignatura asignatura en el microservicio
	#HU1
    #####################################################################################
    #Test 1: Se obtiene horario de la asignatura correctamente
    def test_obtiene_horario_asignatura_ok
        a_anadir = @grado
        #Añadimos para poder consultar horario
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar horario
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/horario?grupo=P1' 
            res = {"horario"=>[{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"}, {"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"}]}
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 2: Si no se pasan argumentos falla
    def test_obtiene_horario_asignatura_parametros_falla
        a_anadir = @grado
        #Añadimos para poder consultar horario
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar horario
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/horario' 
            res = {"error"=>"es necesario pasar la variable grupo"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 3: Si no existe grado o asignatura falla
    def test_obtiene_horario_asignatura_falla
        #Probamos a consultar horario
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/horario?grupo=P1'
            res = {"error"=>"No se ha encontrado el grado o asignatura"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para obtener enlaces asignatura
	#
	#método: obtener enlaces asignatura asignatura en el microservicio
	#HU6
    #####################################################################################
    #Test 1: Se obtienen enlaces de la asignatura correctamente
    def test_obtiene_enlaces_asignatura_ok
        a_anadir = @grado
        #Añadimos para poder consultar enlaces
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar enlaces
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/enlace?grupo=P1' 
            res = {"enlace"=>"https://meet.jit.si/IV-ETSIIT-UGR-2020"}
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 2: Si no se pasan argumentos falla
    def test_obtiene_enlaces_asignatura_parametros_falla
        a_anadir = @grado
        #Añadimos para poder consultar enlaces
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar enlaces
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/enlace' 
            res = {"error"=>"es necesario pasar la variable grupo"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 3: Si no existe grado o asignatura falla
    def test_obtiene_enlaces_asignatura_falla
        #Probamos a consultar enlaces
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/enlace?grupo=P1'
            res = {"error"=>"No se ha encontrado el grado o asignatura"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end
    
    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para obtener turnos asignatura
	#
	#método: obtener turnos asignatura asignatura en el microservicio
	#HU2
    #####################################################################################
    #Test 1: Se obtienen turnos de la asignatura correctamente
    def test_obtiene_turnos_asignatura_ok
        a_anadir = @grado
        #Añadimos para poder consultar turnos
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar turnos
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/turno?turno=1&mes=dec' 
            res = {"turnos"=>["7dec - 11dec", "21dec - 22dec"]}
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 2: Si no se pasan argumentos falla
    def test_obtiene_turnos_asignatura_parametros_falla
        a_anadir = @grado
        #Añadimos para poder consultar turnos
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar turnos
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/turno' 
            res = {"error"=>"es necesario pasar la variable turno y mes"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 3: Si no existe grado o asignatura falla
    def test_obtiene_turnos_asignatura_falla
        #Probamos a consultar turnos
        get '/grado/0e78a27a1e605334c0ba/asignatura/50bbd28fa87ba567f7bd/turno?turno=1&mes=dec'
            res = {"error"=>"No se ha encontrado el grado o asignatura"}
            res = res.to_json
            assert_equal last_response.status, 404
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para obtener todos los grados
	#
	#método: obtener todos los grados en el microservicio
	#HU10
    #####################################################################################
    #Test 1: Se obtienen grados correctamente
    def test_obtiene_todos_grados_ok
        a_anadir = @grado
        #Añadimos para poder consultar grados
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar grados
        get '/grados' 
            res = [{"id"=>"0e78a27a1e605334c0ba","asignaturas"=>[{"id"=>"50bbd28fa87ba567f7bd","siglas"=>"IV","nombre"=>"Infraestructura Virtual","horario_teoria"=>{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"},"horario_practicas"=>[{"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"},{"dia"=>"5-Viernes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P2"}],"turno_presencialidad"=>[["28sep - 2oct","12oct - 16oct","26oct - 30oct","9nov - 13nov","23nov - 27nov","7dec - 11dec","21dec - 22dec"],["5oct - 9oct","19oct - 23oct","2nov - 6nov","16nov - 20nov","30nov - 4dec","14dec - 18dec","8jan y 11jan - 14jan"]],"grupo"=>"A","enlaces_clase_online"=>["https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020"],"curso"=>"4"}],"nombre_grado"=>"Ingeniería Informática","enlace_grado"=>"https://grados.ugr.es/informatica/"}]
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end

    #Test 2: Se obtienen grados vacios
    def test_obtiene_todos_grados_ok2
        #Probamos a consultar grados
        get '/grados' 
            res = []
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método para obtener todas las asignaturas
	#
	#método: obtener todas las asignaturas en el microservicio
	#HU4
    #####################################################################################
    #Test 1: Se obtienen asignaturas correctamente
    def test_obtiene_todas_asignaturas_ok
        a_anadir = @grado
        #Añadimos para poder consultar asignaturas
        put '/grado/0e78a27a1e605334c0ba', a_anadir.to_json    

        #Probamos a consultar asignaturas
        get '/grado/0e78a27a1e605334c0ba/asignaturas' 
            res = [{"id"=>"50bbd28fa87ba567f7bd","siglas"=>"IV","nombre"=>"Infraestructura Virtual","horario_teoria"=>{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"},"horario_practicas"=>[{"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"},{"dia"=>"5-Viernes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P2"}],"turno_presencialidad"=>[["28sep - 2oct","12oct - 16oct","26oct - 30oct","9nov - 13nov","23nov - 27nov","7dec - 11dec","21dec - 22dec"],["5oct - 9oct","19oct - 23oct","2nov - 6nov","16nov - 20nov","30nov - 4dec","14dec - 18dec","8jan y 11jan - 14jan"]],"grupo"=>"A","enlaces_clase_online"=>["https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020"],"curso"=>"4"}]
            res = res.to_json
            assert_equal last_response.status, 200
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
        FileUtils.rm_rf("../data/0e78a27a1e605334c0ba")
    end
end