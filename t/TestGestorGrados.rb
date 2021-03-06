require "minitest/autorun"
require "minitest/mock"
require "date"
require 'fileutils'
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"
require_relative "../lib/FSDator.rb"

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

		dator = FSDator.new("data_test")
		@gestorGrados = GestorGrados.new(dator)
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método anadirGrado
	#
	#método: anadirGrado
	#HU10
	#####################################################################################

	#Test1
	#Comprueba que se añade correctamente un grado
	def test_that_grado_aniadido_correcto
		id = @gestorGrados.AnadirGrado(@informatica)
		assert_equal "Ingeniería Informática", @gestorGrados.obtenerGrado(id).nombre_grado
	end

	#Test2
	#Si se pasa mal un objeto al método debe saltar excepción
	def test_that_return_error_si_parametro_erroneo
		assert_raises(StandardError, "Error, objeto pasado como parámetro incorrecto"){@gestorGrados.AnadirGrado(@asignatura2)}
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método eliminarGrado
	#
	#método: eliminarGrado
	#HU10
	#####################################################################################
	#Test1
	#Comprueba que se añade correctamente un grado y posteriormente si se intenta eliminar de nuevo salta excepción
	def test_that_grado_eliminado_correctamente
		id = @gestorGrados.AnadirGrado(@informatica)
		assert_equal "Ingeniería Informática", @gestorGrados.obtenerGrado(id).nombre_grado
		@gestorGrados.eliminarGrado(id)
		assert_raises(StandardError, "Error, no existe dicho grado"){@gestorGrados.eliminarGrado(id)}
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método obtenerGrado
	#
	#método: obtenerGrado
	#HU10
	#####################################################################################
	def test_that_grado_obtenido_correcto
		id = @gestorGrados.AnadirGrado(@informatica)
		assert_equal "Ingeniería Informática", @gestorGrados.obtenerGrado(id).nombre_grado
	end

	def test_that_grado_obtenido_incorrecto
		assert_raises(StandardError, "Error, no existe dicho grado"){@gestorGrados.obtenerGrado('123')}
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método obtenerGrado
	#
	#método: eliminaAsignatura
	#HU4
	#####################################################################################
	def test_that_elimina_asignatura_correctamente
		id = @gestorGrados.AnadirGrado(@informatica)
		assert_equal 2, @gestorGrados.todasAsignaturas(id).length()
		asignaturas = @gestorGrados.todasAsignaturas(id)
		id2 = asignaturas[0].id

		@gestorGrados.eliminaAsignatura(id, id2)
		assert_equal 1, @gestorGrados.todasAsignaturas(id).length()
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método añadeAsignatura
	#
	#método: añadeAsignatura
	#HU4
	#####################################################################################
	def test_that_anade_asignatura_correctamente
		id = @gestorGrados.AnadirGrado(@informatica)
		assert_equal 2, @gestorGrados.todasAsignaturas(id).length()
		asignaturas = @gestorGrados.todasAsignaturas(id)
		id2 = asignaturas[0].id

		@gestorGrados.eliminaAsignatura(id, id2)
		assert_equal 1, @gestorGrados.todasAsignaturas(id).length()

		@gestorGrados.añadeAsignatura(id, @asignatura1)
		assert_equal 2, @gestorGrados.todasAsignaturas(id).length()
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método obtenerAsignatura
	#
	#método: obtenerAsignatura
	#HU4
	#####################################################################################
	def test_that_obtiene_asignatura_correctamente
		id = @gestorGrados.AnadirGrado(@informatica)
		asignaturas = @gestorGrados.todasAsignaturas(id)
		id2 = asignaturas[0].id

		assert_equal "Infraestructura Virtual", @gestorGrados.obtenerAsignatura(id, id2).nombre
	end


	#####################################################################################
	#Tests que comprueba que funciona correctamente el método horarioAsignatura
	#
	#método: horarioAsignatura
	#HU1
	#####################################################################################
	def test_that_obtiene_horario_correctamente
		id = @gestorGrados.AnadirGrado(@informatica)
		asignaturas = @gestorGrados.todasAsignaturas(id)
		id2 = asignaturas[0].id

		horario = @gestorGrados.horarioAsignatura(id, id2, "P1")

		assert_equal "T", horario[0].grupo
		assert_equal "P1", horario[1].grupo
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método enlacesAsignatura
	#
	#método: enlacesAsignatura
	#HU6
	#####################################################################################
	def test_that_obtiene_enlace_correctamente
		id = @gestorGrados.AnadirGrado(@informatica)
		asignaturas = @gestorGrados.todasAsignaturas(id)
		id2 = asignaturas[0].id

		enlaces = @gestorGrados.enlacesAsignatura(id, id2, "P1")


		assert_equal "https://meet.jit.si/IV-ETSIIT-UGR-2020", enlaces
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método turnosAsignatura
	#
	#método: turnosAsignatura
	#HU2
	#####################################################################################
	def test_that_obtiene_turno_correctamente
		id = @gestorGrados.AnadirGrado(@informatica)
		asignaturas = @gestorGrados.todasAsignaturas(id)
		id2 = asignaturas[0].id

		turnos = @gestorGrados.turnosAsignatura(id, id2, "1", "dec")

		assert_equal 2, turnos.length()
		assert_equal "7dec - 11dec", turnos[0]
	end

	Minitest.after_run {
		FileUtils.rm_rf("data_test")
	}
end