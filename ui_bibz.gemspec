$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ui_bibz/version"

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ui_bibz"
  s.version     = UiBibz::VERSION
  s.authors     = ["Thooams"]
  s.email       = "thomas@hummel.link"
  s.homepage    = "http://thooams.github.io/Ui-Bibz/"
  s.summary     = "Create your project with Ui Bibz. Over a thirty reusable components built to provide iconography, dropdowns, input groups, navigation, alerts, and much more."
  s.description = "A Rails Interface Framework using Bootstrap."
  s.license     = "MIT"

  s.required_ruby_version = '>= 2.0'
  s.post_install_message  = 'Thanks for installing Ui Bibz!'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "vendor"]

  # Rails gems
  #s.add_dependency 'bundler', '>= 1.8.4'
  s.add_dependency 'rails', '>= 4.2.0'
  s.add_dependency 'will_paginate', '~> 3.1.0'
  s.add_dependency 'will_paginate-bootstrap'
  s.add_dependency 'will-paginate-i18n'
  s.add_dependency 'haml'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails', '>= 5.0.0'
  s.add_dependency 'font-awesome-sass'
  s.add_dependency 'bootstrap', '4.0.0.alpha5'

  # Javascript gems (rails-assets.org)
  #s.add_dependency 'rails-assets-tether', '>= 1.1.0'
  #s.add_dependency 'rails-assets-bootstrap-select', '>= 1.10.0'
  #s.add_dependency 'rails-assets-bootstrap-datepicker', '>= 1.6.0'

  # not compatible with boostrap 4
  #s.add_dependency 'rails-assets-bootstrap-switch', '>= 3.3.2'
  #s.add_dependency 'rails-assets-bootstrap-multiselect', '>= 0.9.13'

  # Development gems
  s.add_development_dependency "minitest"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "codeclimate-test-reporter"
end
