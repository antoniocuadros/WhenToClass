require "rake/testtask"

#Tareas
task default: %w[install]
task test: %w[testIntegracion testunitariosasignaturas testunitariosgrado testunitariosgestorgrados testFSDator testDator testParse]
task testv: %w[testvercel]

desc "Instala todas las dependencias"
task :install do
	exec "bundle install"
end

desc "Se inicia el microservicio"
task :start do
	exec "pm2 start 'rackup config.ru' --name 'api-whentoclass'"
end

desc "Se detiene el microservicio"
task :stop do
	exec "pm2 stop api-whentoclass"
end

desc "Se construye el proyecto"
task :build do

end

Rake::TestTask.new do |t|
	t.name = "testunitariosasignaturas"
	t.test_files = FileList['t/TestAsignaturas.rb']
end

Rake::TestTask.new do |t|
	t.name = "testunitariosgrado"
	t.test_files = FileList['t/TestGrado.rb']
end

Rake::TestTask.new do |t|
	t.name = "testunitariosgestorgrados"
	t.test_files = FileList['t/TestGestorGrados.rb']
end

Rake::TestTask.new do |t|
	t.name = "testvercel"
	t.test_files = FileList['api/t/testEnlace.rb']
end

Rake::TestTask.new do |t|
	t.name = "testIntegracion"
	t.test_files = FileList['t/TestApi.rb']
end

Rake::TestTask.new do |t|
	t.name = "testFSDator"
	t.test_files = FileList['t/TestFSDator.rb']
end

Rake::TestTask.new do |t|
	t.name = "testDator"
	t.test_files = FileList['t/TestDator.rb']
end

Rake::TestTask.new do |t|
	t.name = "testParse"
	t.test_files = FileList['t/TestParse.rb']
end