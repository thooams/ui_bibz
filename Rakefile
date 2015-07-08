begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'
# Maintain your gem's version:
require "ui_bibz/version"
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.main      = 'README.md'
  rdoc.rdoc_dir  = "rdoc-v#{ UiBibz::VERSION }"
  rdoc.title     = "Ui Bibz Documentation v#{ UiBibz::VERSION  }"
  rdoc.generator = 'fivefish'
  #rdoc.options << '--line-numbers'
  rdoc.options << "--all"

  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/ui_bibz/ui/**/*.rb')
  rdoc.rdoc_files.include('lib/ui_bibz/helpers/*.rb')
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test
