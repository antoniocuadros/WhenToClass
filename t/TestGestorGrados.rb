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
	#Tests que comprueba que funciona correctamente el método obtenerGrado
	#
	#método: obtenerGrado
	#HU9
	#####################################################################################

	#Test1
	#Comprueba que se han añadido los grados
	def test_that_grado_asignado_correcto
		assert_equal "Ingeniería Informática", @gestorGrados.obtenerGrado("Ingeniería Informática").nombre_grado
	end

	#Test2
	#Si no hay grados, debe saltar excepcion
	def test_that_return_error_si_grado_vacio
		@gestorGrados2 = GestorGrados.new
		assert_raises(AsignaturaError, "Error: No existe ningún grado disponible"){@gestorGrados2.obtenerGrado("Ingeniería Informática")}
	end

	#Test3
	#Si no existe el grado, debe saltar una excepcion
	def test_that_return_error_si_grado_no_existe
		assert_raises(AsignaturaError, "Error: No se ha encontrado el grado"){@gestorGrados.obtenerGrado("Magisterio Primaria")}
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método anadirGrado
	#
	#método: anadirGrado
	#HU10
	#####################################################################################
	
	#TEST1
	#Comprobamos que se puede añadir correctamente un grado
	def test_that_añade_correctamente_grado 
		informatica2 = Grado.new("Ingeniería Informática2", "https://grados.ugr.es/informatica/", [@asignatura1, @asignatura2])
		@gestorGrados.AnadirGrado(informatica2)
		assert_equal 2, @gestorGrados.obtenerNumGrados()
	end

	#TEST2
	#Comprobamos que falla si no se le pasa un objeto grado
	def test_that_añade_falla_si_no_grado
		assert_raises(AsignaturaError, "Error: No se puede añadir, no es un objeto Grado"){@gestorGrados.AnadirGrado(@asignatura1)}

	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método eliminarGrado
	#
	#método: eliminarGrado
	#HU10
	#####################################################################################

	#TEST1
	#Comprobamos que se puede eliminar
	def test_that_elimina_correctamente_grado 
		informatica2 = Grado.new("Ingeniería Informática2", "https://grados.ugr.es/informatica/", [@asignatura1, @asignatura2])
		@gestorGrados.AnadirGrado(informatica2)
		assert_equal 2, @gestorGrados.obtenerNumGrados()

		@gestorGrados.eliminarGrado("Ingeniería Informática2")

		assert_equal 1, @gestorGrados.obtenerNumGrados()
	end

	#TEST2
	#Comprobamos que no se puede eliminar si no existe
	def test_that_elimina_grado_falla_si_no_existe
		assert_raises(AsignaturaError, "Error: No se puede eliminar, no existe el Grado"){@gestorGrados.eliminarGrado("Ingeniería Informática3")}
	end

end