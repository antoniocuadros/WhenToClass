require "minitest/autorun"

require_relative "../lib/gestorasignaturas.rb"
require_relative "../lib/asignatura.rb"

class TestGestorAsignaturas < Minitest::Test
	def setup
		@gestor = GestorAsignaturas.new
		
		@asignatura1 = Asignatura.new("Infraestructura Virtual", 
								HorarioAsignatura.new("2-Martes", "11:30", "13:30", "T"), 
								[HorarioAsignatura.new("2-Martes", "9:30", "11:30", "P1"), 
								HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
								"A",
								[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
								["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
								)
		@asignatura2 = Asignatura.new("Desarrollo de Aplicaciones para Internet", 
							HorarioAsignatura.new("3-Miércoles", "11:30", "13:30", "T"), 
							[HorarioAsignatura.new("3-Miércoles", "9:30", "11:30", "P1"), 
							HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
							"A",
							[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
							["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
							)
	end
	#####################################################################################
	#Tests que comprueban el correcto comportamiento del método añadirAsignatura
	#
	#Método: añadirAsignatura
	#
	#####################################################################################
	
	#TEST1
	#Comprueba que salta error si pasamos algo que no es un objeto asignatura
	def test_that_anadirAsignatura_method_return_error_if_no_pasamos_objeto_Asignatura
		#Si le pasamos mal el objeto
		assert_equal "Error: No se puede añadir, no es un objeto Asignatura", @gestor.anadirAsignatura("IV"), "Fallo al saltar error debido a parametro debe ser objeto Asignatura"
	end
=begin
	#TEST2
	#Comprueba que se incrementa  el tamaño del vector al añadir elementos
	def test_that_anadirAsignatura_method_anade_correctamente
		
		@gestor.anadirAsignatura(@asignatura1)
		assert_equal 1, @gestor.anadirAsignatura("IV"), "Fallo al saltar error debido a parametro debe ser objeto Asignatura"
	end
=end
end
