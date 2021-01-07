require "etcd"
require "./lib/app" #fichero de la api

#nos conectamos a etcd
begin
    client = Etcd.client(host: '127.0.0.1', port: 2379)

    # Get
    port = client.get('/nodes/port').value
rescue
    port = "9898" #Por defecto de Rack
end


Rack::Handler.default.run(App)