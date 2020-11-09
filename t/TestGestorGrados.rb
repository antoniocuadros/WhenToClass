require "minitest/autorun"
require "minitest/mock"
require "date"
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"

class TestGestorGrados < Minitest::Test
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

		@gestorGrados = GestorGrados.new([@informatica])
	end

	#####################################################################################
	#Tests básicos para comprobar que funcionan bien las asignaciones en el constructor
	#
	#
	#####################################################################################

	#Test1
	#Comprueba que se han añadido los grados
	#def test_that_grado_asignado_correcto
	#	assert_equal "Ingeniería Informática", @gestorGrados.grados[0].nombre_grado
	#end

end