require "rake/testtask"

task default: %w[install]
task test: %w[testunitariosasignaturas testunitariosgestorasignaturas]

desc "Instala todas las dependencias"
task :install do
	exec "bundle install"
end

Rake::TestTask.new do |t|
	t.name = "testunitariosasignaturas"
	t.test_files = FileList['t/TestAsignaturas.rb']
end

Rake::TestTask.new do |t|
	t.name = "testunitariosgestorasignaturas"
	t.test_files = FileList['t/TestGestorAsignaturas.rb']
end
