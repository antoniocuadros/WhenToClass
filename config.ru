require "etcd"
require "./lib/app" #fichero de la api


Rack::Handler.default.run(App)