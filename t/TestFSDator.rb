require "minitest/autorun"
require "minitest/mock"
require_relative "../lib/asignatura.rb"
require_relative "../lib/horarioasignatura.rb"
require_relative "../lib/asignaturaerror.rb"
require_relative "../lib/gestorgrados.rb"
require_relative "../lib/grado.rb"
require_relative "../lib/FSDator.rb"

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

		@dator = FSDator.new("data_test")
	end

	#####################################################################################
	#Tests que comprueba que funciona correctamente el método nuevoGrado
	#
	#método: nuevoGrado
	#HU12 y HU10
	#####################################################################################

	#Test1
	#Comprueba que se añade correctamente un grado
	def test_that_nuevoGrado_correcto
        @dator.nuevoGrado(@informatica)
        
        id = @informatica.id

        assert_equal "Ingeniería Informática", @dator.obtenerGrado(id).nombre_grado
        @dator.eliminaGrado(id)
	end

	#Test2
	#Si se pasa mal un objeto al método debe saltar excepción
    def test_that_return_error_si_parametro_erroneo
        assert_raises(StandardError, "Error, objeto pasado como parámetro incorrecto"){@dator.nuevoGrado(@asignatura2)}
    end
    
    #####################################################################################
	#Tests que comprueba que funciona correctamente el método eliminaGrado
	#
	#método: eliminaGrado
	#HU12 y HU10
    #####################################################################################
    def test_that_elimina_grado_ok
        @dator.nuevoGrado(@informatica)
        id = @informatica.id

        @dator.eliminaGrado(id)
        assert_raises(StandardError, "Error, no existe dicho grado"){@dator.eliminaGrado(id)}
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método obtenerGrado
	#
	#método: obtenerGrado
	#HU12 y HU10
    #####################################################################################
    def test_that_obtenerGrado_ok
        @dator.nuevoGrado(@informatica)
        id = @informatica.id
        assert_equal "Ingeniería Informática", @dator.obtenerGrado(id).nombre_grado
        @dator.eliminaGrado(id)
    end

    def test_that_obtenerGrado_falla
        assert_raises(StandardError, "Error, no existe dicho grado"){@dator.obtenerGrado("123")}
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método todosGrados
	#
	#método: todosGrados
	#HU12 y HU10
    #####################################################################################
    def test_that_todosGrados_ok
        @dator.nuevoGrado(@informatica)
        assert_equal 1, @dator.todosGrados().length()
        @dator.eliminaGrado(@informatica.id)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método eliminaAsignatura
	#
	#método: eliminaAsignatura
	#HU12 y HU4
    #####################################################################################
    def test_that_eliminaAsignatura_ok
        @dator.nuevoGrado(@informatica)
        idg = @informatica.id
        id = @informatica.asignaturas[0].id

        @dator.eliminaAsignatura(idg, id)
        assert_equal 1, @dator.todasAsignaturas(idg).length()
        @dator.eliminaGrado(idg)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método añadeAsignatura
	#
	#método: añadeAsignatura
	#HU12 y HU4
    #####################################################################################
    def test_that_añadeAsignatura_ok
        @dator.nuevoGrado(@informatica)
        idg = @informatica.id

        @dator.añadeAsignatura(idg, @asignatura1)
        assert_equal 3, @dator.todasAsignaturas(idg).length()
        @dator.eliminaGrado(idg)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método obtenerAsignatura
	#
	#método: obtenerAsignatura
	#HU12 y HU4
    #####################################################################################
    def test_that_obtenerAsignatura_ok
        @dator.nuevoGrado(@informatica)
        idg = @informatica.id
        id = @informatica.asignaturas[0].id

        assert_equal "Infraestructura Virtual", @dator.obtenerAsignatura(idg, id).nombre
        @dator.eliminaGrado(idg)
    end

    #####################################################################################
	#Tests que comprueba que funciona correctamente el método todasAsignaturas
	#
	#método: todasAsignaturas
	#HU12 y HU4
    #####################################################################################
    def test_that_todasAsignaturas_ok
        @dator.nuevoGrado(@informatica)
        idg = @informatica.id

        
        assert_equal 2, @dator.todasAsignaturas(idg).length()
        @dator.eliminaGrado(idg)
    end

    Minitest.after_run {
		FileUtils.rm_rf("data_test")
	}
end