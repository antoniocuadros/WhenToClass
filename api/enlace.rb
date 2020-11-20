require 'json'

Handler = Proc.new do |req, res|
  #obtenemos los parámetros
  asignatura = req.query['asignatura']
  modalidad = req.query['m']
  dia = req.query['d']

  #################
  #Leemos el fichero de datos
  ubicacion = File.join(File.dirname(__FILE__),'data.json')
  fichero = File.read(ubicacion)
  datos = JSON.parse(fichero)


  dias_validos = ["L","M","X","J","V"]
  modalidades_validas = ["T","P"]

  #comprobamos la validez de los argumentos
  if asignatura != nil and modalidad != nil and dia != nil
    asignatura.upcase
    modalidad = modalidad.upcase
    dia = dia.upcase

    a_buscar = asignatura.to_s + modalidad.to_s + dia.to_s
  else
    a_buscar = ""
  end


  #no se ha pasado algún parámetro                          se ha pasado un parámetro no válido
  if( (asignatura == nil or modalidad == nil or dia == nil) or (datos["asignaturas"][a_buscar] == nil))
    #Si no pasa algún parámetro o falla alguno, le recuperamos los enlaces de las clases de hoy
    hoy = Time.now
    
    dia_semana = dias_validos[hoy.wday-1]

    a_devolver = Array.new
    for i in datos["asignaturas"]
      if i[0][(i[0].length)-1] == dia_semana
        msg = "La clase de " + i[1]["modalidad"].to_s  + " tendrá lugar de " + i[1]["horas"].to_s + " el " + i[1]["dia"].to_s
        a_devolver.push({asignatura:i[1]["nombreAsignatura"], enlace:i[1]["enlace"], info:msg})
      end
    end
    
    #Puede pasar que hoy no hayan asignaturas, en ese caso:
    if a_devolver.length == 0
      a_devolver = {error: "No se ha encontrado la asignatura, compruebe los parámetros, se adjuntan las asignaturas del día de hoy :)", enlaces_hoy:"No hay asignaturas hoy"}
    else
      a_devolver = {error: "No se ha encontrado la asignatura, compruebe los parámetros, se adjuntan las asignaturas del día de hoy :)", enlaces_hoy:a_devolver}
    end
  else
    msg = "La clase de " + datos["asignaturas"][a_buscar]["modalidad"].to_s  + " tendrá lugar de " + datos["asignaturas"][a_buscar]["horas"].to_s + " el " + datos["asignaturas"][a_buscar]["dia"].to_s
    a_devolver = {asignatura:datos["asignaturas"][a_buscar]["nombreAsignatura"], enlace:datos["asignaturas"][a_buscar]["enlace"], info:msg  }
  end

  res.status = 200
  res['Content-Type'] = 'application/json; charset=utf-8'
  res.body = a_devolver.to_json
end
