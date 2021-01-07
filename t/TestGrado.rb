require "minitest/autorun"
require_relative "../lib/grado.rb"
require_relative "../lib/asignatura.rb"
require_relative "../lib/asignaturaerror.rb"

class TestGrado < Minitest::Test
	def setup
		@informatica = Grado.new("Ingeniería Informática", "https://grados.ugr.es/informatica/")
		
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

		@asignatura3 = Asignatura.new("Fundamentos de la programación", 
							HorarioAsignatura.new("3-Miércoles", "11:30", "13:30", "T"), 
							[HorarioAsignatura.new("3-Miércoles", "9:30", "11:30", "P1"), 
							HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
							"A",
							[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
							["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
							["https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020"],
							"1",
							)

		@asignatura4 = Asignatura.new("Fundamentos del software", 
							HorarioAsignatura.new("3-Miércoles", "11:30", "13:30", "T"), 
							[HorarioAsignatura.new("3-Miércoles", "9:30", "11:30", "P1"), 
							HorarioAsignatura.new("5-Viernes", "9:30", "11:30", "P2")],
							"A",
							[["28sep - 2oct", "12oct - 16oct", "26oct - 30oct", "9nov - 13nov", "23nov - 27nov", "7dec - 11dec", "21dec - 22dec"],
							["5oct - 9oct", "19oct - 23oct", "2nov - 6nov","16nov - 20nov", "30nov - 4dec", "14dec - 18dec", "8jan y 11jan - 14jan"]],
							["https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020", "https://meet.jit.si/IV-ETSIIT-UGR-2020"],
							"1",
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
		@informatica.anadirAsignatura(@asignatura1)
		@informatica.anadirAsignatura(@asignatura2)
		assert_equal 2, @informatica.contarAsignaturas(), "Fallo al añadir elemento"
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
		assert_raises(AsignaturaError, "Error: No se puede añadir, no es un objeto Asignatura"){@informatica.anadirAsignatura("IV")}
	end

	#TEST2
	#Comprueba que se incrementa  el tamaño del vector al añadir elementos
	def test_that_anadirAsignatura_method_anade_correctamente
		
		@informatica.anadirAsignatura(@asignatura1)
		@informatica.anadirAsignatura(@asignatura2)
		assert_equal 2, @informatica.contarAsignaturas(), "Fallo al añadir elemento"
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
		assert_nil @informatica.obtenerAsignatura("Infraestructura Virtual")
	end
	
	#TEST2
	#Si existe se devuelve la asignatura
	def test_that_obtenerAsignatura_nombres_method_return_asignatura
		@informatica.anadirAsignatura(@asignatura1)
		assert_instance_of Asignatura, @informatica.obtenerAsignatura("Infraestructura Virtual")
		asig = @informatica.obtenerAsignatura("Infraestructura Virtual")
		assert_equal "Infraestructura Virtual", asig.nombre
	end

	#TEST3
	#Podemos encontrar una asignatura por sus siglas
	def test_that_obtenerAsignatura_siglas_method_return_asignatura
		@informatica.anadirAsignatura(@asignatura1)
		assert_instance_of Asignatura, @informatica.obtenerAsignatura("IV")
		asig = @informatica.obtenerAsignatura("IV")
		assert_equal "IV", asig.siglas

		@informatica.anadirAsignatura(@asignatura2)
		assert_instance_of Asignatura, @informatica.obtenerAsignatura("DAI")
		asig = @informatica.obtenerAsignatura("DAI")
		assert_equal "DAI", asig.siglas
	end

	#TEST4
	#Si existe se devuelve la asignatura
	def test_that_obtenerAsignatura_id_method_return_asignatura
		@informatica.anadirAsignatura(@asignatura1)
		assert_instance_of Asignatura, @informatica.obtenerAsignatura_id(@asignatura1.id)
		asig = @informatica.obtenerAsignatura("Infraestructura Virtual")
		assert_equal "Infraestructura Virtual", asig.nombre
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
		@informatica.anadirAsignatura(@asignatura1)
		@informatica.eliminarAsignatura("DAI")
		assert_equal 1, @informatica.contarAsignaturas(), "Fallo al borrar elemento, no se podía borrar"
	end
	
	#TEST2
	#Se comprueba que se borra un elemento que existe
	def test_that_eliminarAsignatura_method_borra_si_existe
		@informatica.anadirAsignatura(@asignatura1)
		@informatica.eliminarAsignatura("Infraestructura Virtual")
		assert_equal 0, @informatica.contarAsignaturas(), "Fallo al borrar elemento"
	end
	
	#TEST3
	#Se elimina una asignatura por sus siglas
	def test_that_eliminarAsignatura_siglas_method_borra_si_existe
		@informatica.anadirAsignatura(@asignatura1)
		@informatica.eliminarAsignatura("IV")
		assert_equal 0, @informatica.contarAsignaturas(), "Fallo al borrar elemento"
	end

	
	#TEST2
	#Se comprueba que se borra un elemento que existe
	def test_that_eliminarAsignatura_id_method_borra_si_existe
		@informatica.anadirAsignatura(@asignatura1)
		@informatica.eliminarAsignatura_id(@asignatura1.id)
		assert_equal 0, @informatica.contarAsignaturas(), "Fallo al borrar elemento"
	end

	#####################################################################################
	#Tests que comprueban el correcto comportamiento del método obtenerAsignaturaPorCurso
	#
	#Método: obtenerAsignaturaPorCurso
	#
	#####################################################################################
	
	#TEST1
	#Se comprueba que si se quieren obtener las asignaturas y no hay ninguna devuelve error
	def test_that_si_no_asignaturas_obtenerAsignaturaPorCurso_return_error
		assert_raises(AsignaturaError, "Error: No existen asignaturas ahora mismo"){@informatica.obtenerAsignaturaPorCurso("4")}
	end

	#TEST2
	#Se comprueba que si el curso pasado no es válido da error
	def test_that_si_curso_no_valido_obtenerAsignaturaPorCurso_return_error
		assert_raises(AsignaturaError, "Error: El curso especificado no es válido"){@informatica.obtenerAsignaturaPorCurso("0")}
		assert_raises(AsignaturaError, "Error: El curso especificado no es válido"){@informatica.obtenerAsignaturaPorCurso("5")}
	end

	#TEST3
	#Se comprueba que si todo se pasa bien y hay asignaturas, se devuelven las del curso especificado
	def test_that_return_asignaturas_obtenerAsignaturaPorCurso
		@informatica.anadirAsignatura(@asignatura1)
		@informatica.anadirAsignatura(@asignatura2)
		@informatica.anadirAsignatura(@asignatura3)
		@informatica.anadirAsignatura(@asignatura4)
		
		asignaturas = @informatica.obtenerAsignaturaPorCurso("4")

		assert_equal "Infraestructura Virtual", asignaturas[0], "Fallo al obtener las asignaturas"
		assert_equal "Desarrollo de Aplicaciones para Internet", asignaturas[1], "Fallo al obtener las asignaturas"

	end

	#####################################################################################
	#Tests basicos para comprobar que los atributos han sido asignados correctamente
	#
	#
	#####################################################################################

	#TEST1
	#se comprueba que el nombre es correcto
	def test_that_return_nombre_grado
		assert_equal "Ingeniería Informática", @informatica.nombre_grado, "Fallo al obtener el nombre del grado"
	end

	#TEST2
	#se comprueba que el enlace del grado es correcto
	def test_that_return_enlace_grado
		assert_equal "https://grados.ugr.es/informatica/", @informatica.enlace_grado, "Fallo al obtener el enlace del grado"
	end

	#TEST3
	#se comprueba que se añaden bien asignaturas en el constructor
	def test_that_return_asignatura
		@informatica2 = Grado.new("Ingeniería Informática", "https://grados.ugr.es/informatica/", [@asignatura1])

		assert_equal "Infraestructura Virtual", @informatica2.obtenerAsignatura("Infraestructura Virtual").nombre, "Fallo al construir el grado"
	end
end
