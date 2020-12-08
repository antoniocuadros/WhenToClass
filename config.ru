require "etcdv3"
require "./lib/app" #fichero de la api

#nos conectamos a etcd
cliente_etcd = Etcdv3.new(endpoints: 'http://127.0.0.1:2379')

 # Get
port = cliente_etcd.get('port').kvs.first.value

Rack::Handler.default.run(App, :Port => port)