#Clase para lanzar excepciones relacionadas con las asignaturas
class AsignaturaError < StandardError
	def initialize(msg="Error")
		super(msg)
	end
end
