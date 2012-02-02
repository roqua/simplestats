# encoding: utf-8

require 'rubygems'
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "simplestats"
  gem.homepage = "http://github.com/marten/simplestats"
  gem.license = "MIT"
  gem.summary = %Q{A really simple webstats collection engine}
  gem.description = %Q{A Sinatra application that makes it easy to collect and store web statistics}
  gem.email = "marten@veldthuis.com"
  gem.authors = ["Marten Veldthuis"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.add_runtime_dependency "sinatra", '~> 1.3'
  gem.add_development_dependency "rspec", "~> 2.8.0"
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency "rdoc", "~> 3.12"
  gem.add_development_dependency "jeweler", "~> 1.8.3"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "simplestats #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
