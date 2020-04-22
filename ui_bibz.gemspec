# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'ui_bibz/infos'

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ui_bibz'
  s.version     = UiBibz::VERSION
  s.authors     = ['Thooams']
  s.email       = 'thomas@hummel.link'
  s.homepage    = 'http://thooams.github.io/Ui-Bibz/'
  s.summary     = 'Create your project with Ui Bibz. Over a thirty reusable components built to provide iconography, dropdowns, input groups, navigation, alerts, and much more.'
  s.description = 'A Rails Interface Framework using Bootstrap.'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.7'

  s.files         = `git ls-files`.split
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split
  s.executables   = `git ls-files -- bin/*`.split.map { |f| File.basename(f) }
  s.require_paths = %w[lib vendor]

  # Rails gems
  s.add_dependency 'bootstrap', UiBibz::BOOTSTRAP_VERSION
  s.add_dependency 'haml'
  s.add_dependency 'haml-rails'
  s.add_dependency 'jquery-rails', '>= 3.1.0'
  s.add_dependency 'popper_js'
  s.add_dependency 'rails', '>= 4.2.0'
  s.add_dependency 'sass-rails', '>= 5.0.0'
  s.add_dependency 'will-paginate-i18n'
  s.add_dependency 'will_paginate', '~> 3.1.0'
  s.add_dependency 'will_paginate-bootstrap4'

  # Development gems
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'factory_bot_rails', '~> 4.0'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'overcommit'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simple_form'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
