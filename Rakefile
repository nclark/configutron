require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "configutron"
    gem.summary = %Q{simple app-wide settings for rails apps}
    gem.description = %Q{simple app-wide settings for rails applications}
    gem.email = "nclark@thrownproject.com"
    gem.homepage = "http://github.com/nclark/configutron"
    gem.authors = ["Neal Clark"]
    gem.add_dependency "activesupport", ">= 0"
    gem.add_runtime_dependency "activesupport", ">= 0"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "fakefs", ">= 0.2.1"
    
    gem.files = [
       ".gitignore",
       "LICENSE",
       "README.markdown",
       "Rakefile",
       "VERSION",
       "lib/configutron.rb",
       "lib/core_ext.rb",
       "rails/init.rb",
       "spec/configutron_spec.rb",
       "spec/spec.opts",
       "spec/spec_helper.rb",
       "spec/fake_yml_files.rb"
    ]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION.yml') ? File.read('VERSION.yml') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "configutron #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
