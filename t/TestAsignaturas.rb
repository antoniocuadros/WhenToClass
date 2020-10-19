require "minitest/autorun"
require "minitest/mock"
require "date"
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"

class TestAsignaturas < Minitest::Test
	#####################################################################################
	#Definimos en primer lugar un objeto de la clase con el cual vamos a 
	#trabajar en los tests
	#####################################################################################
	def setup
		@asignatura = Asignatura.new("Infraestructura Virtual", 
						HorarioAsignatura.new("2-Martes", "11:30", "13:30", "T"), 
						[HorarioAsignatura.new("2-Martes", "9:30", "11:30", "P1"), 
						HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
						"A",
						[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
						["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
						)
		@asignaturaSinHorarioTeoria = Asignatura.new("Infraestructura Virtual", 
						nil, 
						[HorarioAsignatura.new("2-Martes", "9:30", "11:30", "P1"), 
						HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
						"A",
						[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
						["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
						)
		@asignaturaSinHorarioPracticas = Asignatura.new("Infraestructura Virtual", 
						HorarioAsignatura.new("2-Martes", "11:30", "13:30", "T"), 
						nil,
						"A",
						[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
						["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
						)
		@asignaturaSinHorario = Asignatura.new("Infraestructura Virtual", 
						nil, 
						nil,
						"A",
						[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
						["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
						)
	end
	
	#####################################################################################
	#Con los siguientes tests vamos a comprobar si funciona correctamente el método
	#que nos permite obtener tanto el horario de prácticas como el de teoría
	#ordenado por el día de la semana
	#
	#Método: obtenerHorario
	#
	#####################################################################################
	
	

	
	#####################################################################################
	#Con los siguientes tests vamos a comprobar si funciona correctamente el método
	#que nos permite dado un turno (1, 2, ...) y un mes devolver el conjunto
	#de días que hay que ir
	#
	#Método: obtenerDiasPresenciales
	#
	#####################################################################################
	
	
	
	#####################################################################################
	#Con los siguientes tests vamos a comprobar si funciona correctamente el método
	#que nos permite saber si debemos ir esta semana a una asignatura
	#
	#Método: tengoQueIrEstaSemana
	#
	#####################################################################################
	
	


	
	#Tests básicos
	#####################################################################################
	#Con los siguientes tests vamos a comprobar básicamente que el constructor
	#ha hecho bien las asignaciones al tratarse de asignaciones de matrices y
	#estructuras, vamos a obtener los datos que hemos incluido al objeto para
	#comprobar que es correcto a través de los métodos get
	#####################################################################################
	
	#TEST 1
	#Nombre de la asignatura
	def test_that_return_nombre_asignatura
		assert_equal "Infraestructura Virtual", @asignatura.nombre, "Fallo al obtener el nombre de la asignatura"
	end
	
	#TEST 2
	#Horario de teoría
	def test_that_return_horario_teoria
		assert_equal "2-Martes", @asignatura.horario_teoria.dia, "Fallo al obtener el día de teoría"
		assert_equal "11:30", @asignatura.horario_teoria.hora_inicio, "Fallo al obtener el horario inicio de teoría"
		assert_equal "13:30", @asignatura.horario_teoria.hora_fin, "Fallo al obtener el horario fin de teoría"
		assert_equal "T", @asignatura.horario_teoria.grupo, "Fallo al obtener el grupo de teoría"
	end
	
	#TEST 3
	#Horario de prácticas
	def test_that_return_horario_practicas
		assert_equal "2-Martes", @asignatura.horario_practicas[0].dia, "Fallo al obtener el día de prácticas"
		assert_equal "9:30", @asignatura.horario_practicas[0].hora_inicio, "Fallo al obtener el horario inicio de prácticas"
		assert_equal "11:30", @asignatura.horario_practicas[0].hora_fin, "Fallo al obtener el horario fin de prácticas"
		assert_equal "P1", @asignatura.horario_practicas[0].grupo, "Fallo al obtener el grupo de prácticas"

		assert_equal "5-Viernes", @asignatura.horario_practicas[1].dia, "Fallo al obtener el día de prácticas"
		assert_equal "9:30", @asignatura.horario_practicas[1].hora_inicio, "Fallo al obtener el horario inicio de prácticas"
		assert_equal "11:30", @asignatura.horario_practicas[1].hora_fin, "Fallo al obtener el horario fin de prácticas"
		assert_equal "P2", @asignatura.horario_practicas[1].grupo, "Fallo al obtener el grupo de prácticas"
	end
	
	#TEST 4
	#Grupo
	def test_that_return_grupo
		assert_equal "A", @asignatura.grupo, "Fallo al obtener el grupo de la asignatura"
	end
end
