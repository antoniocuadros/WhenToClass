#Antonio Cuadros Lapresta
require_relative "horarioasignatura.rb"

##############################################################################################
#												#
#					Clase Asignatura					#
#												#
##############################################################################################
class Asignatura
	#Métodos get
	attr_reader:nombre
	attr_reader:horario_teoria 		#será un struct con dia, hora inicio, hora fin
	attr_reader:horario_practicas  	#será un vector de struct con dia, hora inicio, hora fin
	attr_reader:turno_presencialidad 	#Matriz en la primera columna los 
						#turnos: 1, 2... y resto de columnas los días de 
						#cada grupo
	attr_reader:grupo			#Carácter (A, B, C, ...)
	
	def initialize(nombre_asignatura, h_teoria, h_practicas, group, t_presencialidad)
		@nombre = nombre_asignatura
		@horario_teoria = h_teoria
		@horario_practicas = h_practicas
		@grupo = group
		@turno_presencialidad = t_presencialidad
	end
	
	#####################################################################################
	#
	#Método obtenerHorario
	#
	#####################################################################################
	
	#Método que devuelve un vector de structs donde cada struct será un día de prácticas
	#o de teoría
	#Devuelve los structs ordenados en un vector de tal manera que en primera posición
	#estará el horario de la clase de teoría o de prácticas que antes toque (lunes, martes,...)
	#Únicamente devolverá los grupos de prácticas que especifique el usuario
	#Este método responde a la HU1
	def obtenerHorario(grupo_practicas)
		if(@horario_teoria == nil or @horario_practicas == nil)
			return "Error: Horario de teoría o prácticas vacío."
		else
			#En primer lugar comprobamos si el grupo de prácticas existe (de la
			#forma P[1-3] (no hay asignaturas con mas de 3 subgrupos de pr) y luego
			#que el grupo que le pasemos exista)
			if(!/P[1-3]/.match(grupo_practicas) or grupo_practicas.scan(/\d+/).first.to_i > @horario_practicas.length())
				return "Error: Solo hay " + @horario_practicas.length().to_s + " grupos de prácticas"
			else
				#metemos todo en un vector
				clases = Array.new
				clases << @horario_teoria
				for i in 0..@horario_practicas.length() - 1
					if(horario_practicas[i].grupo == grupo_practicas)
						clases << @horario_practicas[i]
					end
				end
				
				#Ordenamos por día de la semana (los dias en primera posición tienen un número)
				for i in 1..clases.length() - 1
					valor_a_ordenar = clases[i]
					posicion = i
					while posicion > 0 and clases[posicion-1].dia[0] > valor_a_ordenar.dia[0] do
						clases[posicion] = clases[posicion - 1]
						posicion = posicion - 1
					end

					clases[posicion] = valor_a_ordenar
				end
				
				#En este punto tenemos ya los días ordenados de lunes a viernes
				#de la asignatura
				#Ahora devolvemos el vector de clases ordenado para que le sea
				#más fácil de consultar
				
				return clases
			end
		end
	end
	
	#####################################################################################
	#
	#Método obtenerDiasPresenciales
	#
	#####################################################################################
	
	#Método que dado un turno de presencialidad y un mes devuelve que días corresponden ir en 
	#ese mes
	def obtenerDiasPresenciales(turno, mes)
		#Comprobamos que el turno que se nos pasa es un número entre 1 y 4
		#Comprobamos que el turno es un número
		if(!/[1-9]/.match(turno) or turno.to_i > @turno_presencialidad.length() or turno.to_i < 0)
			return "Error: El turno debe ser numérico y menor que " + @turno_presencialidad.length().to_s + "."
		end
		
		#comprobamos que el mes es válido
		meses = ["sep", "oct", "nov", "dec", "jan"]
		
		if(!meses.include?(mes))
			return "Error: El mes no es válido."
		else
			#Si no hay errores en los argumentos añadimos a un vector
			#los intervalos de tiempo a los que hay que asistir a clase
			dias = Array.new
			
			#Se añaden todos
			turno_seleccionado = @turno_presencialidad[turno.to_i-1]
			
			#a dias solo se le añaden los del mes
			for i in 0..turno_seleccionado.length() - 1 do
				if(turno_seleccionado[i].include? mes)
					dias << turno_seleccionado[i]
				end
			end
			return dias
		end
		
	end
end
