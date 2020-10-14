require "rake/testtask"

task default: %w[install]

desc "Instala todas las dependencias"
task :install do
	exec "bundle install"
end

Rake::TestTask.new do |t|
	t.name = "test"
	t.test_files = FileList['t/TestAsignaturas.rb']
end
