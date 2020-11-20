require 'json'

Handler = Proc.new do |req, res|
  #obtenemos los parámetros
  asignatura = req.query['asignatura']
  modalidad = req.query['m']
  dia = req.query['d']

  #################
  #Leemos el fichero de datos
  if datos != nil
    ubicacion = File.join(File.dirname(__FILE__),'data.json')
    fichero = File.read(ubicacion)
    datos = JSON.parse(fichero)
  end

  








  res.status = 200

  res['Content-Type'] = 'text/text; charset=utf-8'
  res.body = "Current Time: #{Time.new}"
end
