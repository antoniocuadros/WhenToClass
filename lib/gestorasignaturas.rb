require_relative "horarioasignatura.rb"
require_relative "asignatura.rb"


##############################################################################################
#												#
#					Clase GestorAsignaturas				#
#												#
##############################################################################################

class GestorAsignaturas
	
	#Constructor sin parámetros que indica que la variable asignaturas es un array
	def initialize()
		@asignaturas = Array.new
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
			if(@asignaturas[i].nombre == nombre)
				encontrado = true
				asignatura = @asignaturas[i]
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
			return "Error: No se puede añadir, no es un objeto Asignatura"
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
			if(@asignaturas[i].nombre == nombre)
				encontrado = true
				@asignaturas.delete_at(i)
			end
			i +=1
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


