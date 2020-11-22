require "minitest/autorun"
require_relative "../enlace.rb"

class TestAsignaturas < Minitest::Test
	#####################################################################################
	#Definimos en primer lugar un objeto de la clase con el cual vamos a 
	#trabajar en los tests
	#####################################################################################
	def setup
        @uri1 = URI.parse("https://when-to-class.vercel.app/api/enlace?asignatura=IV&m=p&d=m")
        @response1 = Net::HTTP.get_response(@uri1)
	end
	
	#TEST 1
	#Se comprueba que se devuelve una respuesta correcta
	def test_that_comprueba_devuelve_codigo_correcto
        assert_equal "200", @response1.code
    end

    #TEST 2
    #Se comprueba que la respuesta es correcta
    def test_that_comprueba_texto_devuelto_correcto
        parsed = JSON.parse(@response1.body)

        assert_equal "IV", parsed["asignatura"]
        assert_equal "https://meet.jit.si/IV-ETSIIT-UGR-2020", parsed["enlace"]
        assert_equal "La clase de prácticas tendrá lugar de 9:30-11:30 el Martes", parsed["info"]
    end
    
    #TEST 3
    #Se comprueba que la respuesta sin parámetros es correcta
    def test_that_comprueba_error_devuelto_correctamente
        parsed = JSON.parse(@response2.body)
        assert_equal "No se ha encontrado la asignatura, compruebe los parámetros, se adjuntan las asignaturas del día de hoy :)", parsed["error"]
    end
end