$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ui_bibz/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ui_bibz"
  s.version     = UiBibz::VERSION
  s.authors     = ["Thooams"]
  s.email       = ["thooams@gmail.com"]
  s.homepage    = "https://github.com/thooams/ui-bibz"
  s.summary     = "A Rails plugin with Boostrap framework..."
  s.description = "A Rails plugin with Boostrap framework..."
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # rails
  s.add_dependency 'rails', '~> 4.2.0'
  s.add_dependency 'will_paginate', '~> 3.0.6'
  s.add_dependency 'will_paginate-bootstrap'
  s.add_dependency 'will-paginate-i18n'
  s.add_dependency 'haml'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails', '~> 5.0.1'

  s.add_development_dependency "minitest"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency "codeclimate-test-reporter"

end
