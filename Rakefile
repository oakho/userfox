# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require './lib/userfox/version.rb'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "userfox"
  gem.version = Userfox::VERSION
  gem.homepage = "http://github.com/oakho/userfox"
  gem.license = "MIT"
  gem.summary = %Q{A Ruby Wrapper for the Userfox API}
  gem.description = %Q{This gem is a Ruby Wrapper made to use the Userfox API conveniently}
  gem.email = "hello@oakho.com"
  gem.authors = ["Antoine Lagadec"]
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
  version = Userfox::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "userfox #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
