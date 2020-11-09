require_relative "horarioasignatura.rb"
require_relative "asignatura.rb"


##############################################################################################
#												                                             #
#					Clase grado				                                                 #
#												                                             #
##############################################################################################

class Grado
	attr_reader:nombre_grado			#nombre del grado
	attr_reader:asignaturas				#gestor de las asignaturas del grado
	attr_reader:enlace_grado			#enlace a la información del grado
	
	#Constructor sin parámetros que indica que la variable asignaturas es un array
	def initialize(nombre_grado, enlace_grado, asignaturas=nil)
		@asignaturas = Array.new
		@nombre_grado = nombre_grado
		@enlace_grado = enlace_grado

		if(asignaturas != nil)
			num_asig = asignaturas.length()

			for i in 0..num_asig-1
				@asignaturas.push(asignaturas[i])
			end
		else
			@asignaturas = Array.new
		end
	end
	
	#####################################################################################
	#
	#Método obtenerAsignatura
	#
	#####################################################################################
	
	#Se corresponde con el HU4
	def obtenerAsignatura(nombre)
		encontrado = false
		asignatura = nil
		i = 0
		
		while i < @asignaturas.length() and !encontrado
			if nombre == @asignaturas[i].nombre.gsub('-', ' ').scan(/(\A[A-Z]|(?<=\s)[A-Z])/).flatten.join.upcase	#Podemos buscar por siglas (nos han proporcionado siglas)
				encontrado = true
				asignatura = @asignaturas[i]
			else																									#Si no es sigla, buscamos por nombre (nos han proporcionado nombre)
				if(@asignaturas[i].nombre == nombre)
					encontrado = true
					asignatura = @asignaturas[i]
				end
			end
			i +=1
		end
		#devuelve nil si no se obtiene
		return asignatura
	end
	
	#####################################################################################
	#
	#Método añadirAsignatura
	#
	#####################################################################################
	def anadirAsignatura(asignatura)
		if(asignatura.instance_of? Asignatura)
			@asignaturas << asignatura
		else
			raise AsignaturaError, "Error: No se puede añadir, no es un objeto Asignatura"
		end
	
	end
	
	#####################################################################################
	#
	#Método eliminarAsignatura
	#
	#####################################################################################
	def eliminarAsignatura(nombre)
		i = 0
		encontrado = false
		
		while i < @asignaturas.length() and !encontrado
			if nombre == @asignaturas[i].nombre.gsub('-', ' ').scan(/(\A[A-Z]|(?<=\s)[A-Z])/).flatten.join.upcase	#Si nos dan las siglas
				encontrado = true
				@asignaturas.delete_at(i)	
			else																									#Si nos dan el nombre
				if(@asignaturas[i].nombre == nombre)
					encontrado = true
					@asignaturas.delete_at(i)
				end
			end
			i +=1
		end
	
	end

	#####################################################################################
	#
	#Método obtenerAsignaturaPorCurso
	#
	#####################################################################################
	def obtenerAsignaturaPorCurso(curso)
		if curso.to_i < 1 or curso.to_i > 4
			raise AsignaturaError, "Error: El curso especificado no es válido"
		else
			if @asignaturas.length() == 0
				raise AsignaturaError, "Error: No existen asignaturas ahora mismo"
			else
				a_devolver = []

				for i in 0..@asignaturas.length() -1
					if @asignaturas[i].curso.to_i == curso.to_i
						a_devolver.push(@asignaturas[i].nombre)
					end
				end

				return a_devolver
			end
		end
	end
	
	#####################################################################################
	#
	#Método contarAsignaturas
	#
	#####################################################################################
	def contarAsignaturas()
		return @asignaturas.length()	
	end
end


