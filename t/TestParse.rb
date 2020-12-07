require "minitest/autorun"
require "minitest/mock"
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"
require_relative "../lib/Dator.rb"
require_relative "../lib/parse.rb"

class TestFSDator < Minitest::Test
	#####################################################################################
	#Definimos en primer lugar un objeto de la clase con el cual vamos a 
	#trabajar en los tests
	#####################################################################################
	def setup		
		@asignatura1 = Asignatura.new("Infraestructura Virtual", 
								HorarioAsignatura.new("2-Martes", "11:30", "13:30", "T"), 
								[HorarioAsignatura.new("2-Martes", "9:30", "11:30", "P1"), 
								HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
								"A",
								[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
								["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
								["https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020"],
								"4",
								)
		@asignatura2 = Asignatura.new("Desarrollo de Aplicaciones para Internet", 
							HorarioAsignatura.new("3-Miércoles", "11:30", "13:30", "T"), 
							[HorarioAsignatura.new("3-Miércoles", "9:30", "11:30", "P1"), 
							HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
							"A",
							[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
							["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
							["https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020"],
							"4",
							)

		@informatica = Grado.new("Ingeniería Informática", "https://grados.ugr.es/informatica/", [@asignatura1, @asignatura2])
        
        
        @gradojson = {"id"=>"0e78a27a1e605334c0ba","asignaturas"=>[{"id"=>"50bbd28fa87ba567f7bd","siglas"=>"IV","nombre"=>"Infraestructura Virtual","horario_teoria"=>{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"},"horario_practicas"=>[{"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"},{"dia"=>"5-Viernes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P2"}],"turno_presencialidad"=>[["28sep - 2oct","12oct - 16oct","26oct - 30oct","9nov - 13nov","23nov - 27nov","7dec - 11dec","21dec - 22dec"],["5oct - 9oct","19oct - 23oct","2nov - 6nov","16nov - 20nov","30nov - 4dec","14dec - 18dec","8jan y 11jan - 14jan"]],"grupo"=>"A","enlaces_clase_online"=>["https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020"],"curso"=>"4"}],"nombre_grado"=>"Ingeniería Informática","enlace_grado"=>"https://grados.ugr.es/informatica/"}
        @asignaturajson = {"id"=>"50bbd28fa87ba567f7bd","siglas"=>"IV","nombre"=>"Infraestructura Virtual","horario_teoria"=>{"dia"=>"2-Martes","hora_inicio"=>"11:30","hora_fin"=>"13:30","grupo"=>"T"},"horario_practicas"=>[{"dia"=>"2-Martes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P1"},{"dia"=>"5-Viernes","hora_inicio"=>"9:30","hora_fin"=>"11:30","grupo"=>"P2"}],"turno_presencialidad"=>[["28sep - 2oct","12oct - 16oct","26oct - 30oct","9nov - 13nov","23nov - 27nov","7dec - 11dec","21dec - 22dec"],["5oct - 9oct","19oct - 23oct","2nov - 6nov","16nov - 20nov","30nov - 4dec","14dec - 18dec","8jan y 11jan - 14jan"]],"grupo"=>"A","enlaces_clase_online"=>["https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020","https://meet.jit.si/IV-ETSIIT-UGR-2020"],"curso"=>"4"}
        @parse = Parse.new()
		
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente metodo asignaturaToJSON
	#
	#método: asignaturaToJSON
	#HU12
	#####################################################################################
    def test_that_asignaturaToJSON_correcto
        json = @parse.asignaturaToJSON(@asignatura1)
        assert_equal "Infraestructura Virtual", json['nombre']
    end
    

    
	#####################################################################################
	#Tests que comprueba que funciona correctamente metodo gradoToJSON
	#
	#método: gradoToJSON
	#HU12
	#####################################################################################
    def test_that_gradoToJSON_correcto
        json = @parse.gradoToJSON(@informatica)
        assert_equal "Ingeniería Informática", json['nombre_grado']
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente metodo jsonToAsignatura
	#
	#método: jsonToAsignatura
	#HU12
	#####################################################################################
    def test_that_jsonToAsignatura_correcto
        asig = @parse.jsonToAsignatura(@asignaturajson)
        assert_equal "Infraestructura Virtual", asig.nombre
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente metodo jsonToGrado
	#
	#método: jsonToGrado
	#HU12
	#####################################################################################
    def test_that_jsonToGrado_correcto
        grado = @parse.jsonToGrado(@gradojson)
        assert_equal "Ingeniería Informática", grado.nombre_grado
    end

end