require "minitest/autorun"

require_relative "../lib/gestorasignaturas.rb"
require_relative "../lib/asignatura.rb"
require_relative "../lib/asignaturaerror.rb"

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
								["https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020"]
								)
		@asignatura2 = Asignatura.new("Desarrollo de Aplicaciones para Internet", 
							HorarioAsignatura.new("3-Miércoles", "11:30", "13:30", "T"), 
							[HorarioAsignatura.new("3-Miércoles", "9:30", "11:30", "P1"), 
							HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
							"A",
							[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
							["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
							["https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020"]
							)
	end
	
	#####################################################################################
	#Tests que comprueban el correcto comportamiento del método contarAsignaturas
	#
	#Método: contarAsignaturas
	#
	#####################################################################################	
	
	#TEST1
	#Si se añaden dos asignaturas, el tamaño es 2
	def test_that_contarAsignaturas_method_return_valores_correctos
		@gestor.anadirAsignatura(@asignatura1)
		@gestor.anadirAsignatura(@asignatura2)
		assert_equal 2, @gestor.contarAsignaturas(), "Fallo al añadir elemento"
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
		assert_raises(AsignaturaError, "Error: No se puede añadir, no es un objeto Asignatura"){@gestor.anadirAsignatura("IV")}
	end

	#TEST2
	#Comprueba que se incrementa  el tamaño del vector al añadir elementos
	def test_that_anadirAsignatura_method_anade_correctamente
		
		@gestor.anadirAsignatura(@asignatura1)
		@gestor.anadirAsignatura(@asignatura2)
		assert_equal 2, @gestor.contarAsignaturas(), "Fallo al añadir elemento"
	end
	
	#####################################################################################
	#Tests que comprueban el correcto comportamiento del método obtenerAsignatura
	#
	#Método: obtenerAsignatura
	#Relacionado con HU4
	#####################################################################################

	#TEST1
	#Si no existe el elemento a buscar, se devuelve nil
	def test_that_obtenerAsignatura_method_return_nil_si_no_existe
		assert_nil @gestor.obtenerAsignatura("Infraestructura Virtual")
	end
	
	#TEST2
	#Si existe se devuelve la asignatura
	def test_that_obtenerAsignatura_nombres_method_return_asignatura
		@gestor.anadirAsignatura(@asignatura1)
		assert_instance_of Asignatura, @gestor.obtenerAsignatura("Infraestructura Virtual")
		asig = @gestor.obtenerAsignatura("Infraestructura Virtual")
		assert_equal "Infraestructura Virtual", asig.nombre
	end

	#TEST3
	#Podemos encontrar una asignatura por sus siglas
	def test_that_obtenerAsignatura_siglas_method_return_asignatura
		@gestor.anadirAsignatura(@asignatura1)
		assert_instance_of Asignatura, @gestor.obtenerAsignatura("IV")
		asig = @gestor.obtenerAsignatura("IV")
		assert_equal "IV", asig.siglas

		@gestor.anadirAsignatura(@asignatura2)
		assert_instance_of Asignatura, @gestor.obtenerAsignatura("DAI")
		asig = @gestor.obtenerAsignatura("DAI")
		assert_equal "DAI", asig.siglas
	end

	#####################################################################################
	#Tests que comprueban el correcto comportamiento del método eliminarAsignatura
	#
	#Método: eliminarAsignatura
	#
	#####################################################################################
	
	#TEST1
	#Se comprueba que si se quiere eliminar una asignatura que no existe, el tamaño del vector
	#no varía
	def test_that_eliminarAsignatura_method_no_borra_no_existe
		@gestor.anadirAsignatura(@asignatura1)
		@gestor.eliminarAsignatura("DAI")
		assert_equal 1, @gestor.contarAsignaturas(), "Fallo al borrar elemento, no se podía borrar"
	end
	
	#TEST2
	#Se comprueba que se borra un elemento que existe
	def test_that_eliminarAsignatura_method_borra_si_existe
		@gestor.anadirAsignatura(@asignatura1)
		@gestor.eliminarAsignatura("Infraestructura Virtual")
		assert_equal 0, @gestor.contarAsignaturas(), "Fallo al borrar elemento"
	end
	
	#TEST3
	#Se elimina una asignatura por sus siglas
	def test_that_eliminarAsignatura_siglas_method_borra_si_existe
		@gestor.anadirAsignatura(@asignatura1)
		@gestor.eliminarAsignatura("IV")
		assert_equal 0, @gestor.contarAsignaturas(), "Fallo al borrar elemento"
	end
	
end
