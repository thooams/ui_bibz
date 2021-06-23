# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'ui_bibz/infos'

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = UiBibz::SLUG
  s.version     = UiBibz::VERSION
  s.author      = UiBibz::AUTHOR
  s.email       = UiBibz::EMAIL
  s.homepage    = UiBibz::HOMEPAGE
  s.summary     = UiBibz::SUMMARY
  s.description = UiBibz::DESCRIPTION
  s.license     = UiBibz::LICENSE

  s.required_ruby_version = '>= 3.0.0'

  s.files         = `git ls-files`.split
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split
  s.executables   = `git ls-files -- bin/*`.split.map { |f| File.basename(f) }
  s.require_paths = %w[lib vendor]

  # Rails gems
  s.add_development_dependency 'rails', '~> 6.1.3', '>= 6.1.3.2'

  # Remove these dependencies after
  s.add_dependency 'will_paginate', '~> 3.3.0'
  s.add_dependency 'will_paginate-bootstrap4'
  s.add_dependency 'will-paginate-i18n'

  # Development gems
  s.add_development_dependency 'factory_bot_rails', '~> 4.0'
  s.add_development_dependency 'haml-rails'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'overcommit'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-ast'
  s.add_development_dependency 'rubocop-minitest'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'rubocop-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simple_form'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'yard'
end
