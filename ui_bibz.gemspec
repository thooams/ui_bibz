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

  s.required_ruby_version = '>= 3.3.0'

  s.files         = `git ls-files`.split
  s.executables   = `git ls-files -- bin/*`.split.map { |f| File.basename(f) }
  s.require_paths = %w[lib vendor]

  # Rails gems
  s.add_dependency 'rails', '>= 7.1.0'
  # Switch to bootstrap 5.3.3 as soon as possible
  s.add_dependency 'bootstrap-propshaft', '~> 5.3.2.2'
  s.add_dependency 'dartsass-rails'
  s.add_dependency 'will_paginate'
  # Don't move factory_bot_rails to Gemfile else it will be loaded in test/dummy
  s.add_development_dependency 'factory_bot_rails', '~> 4.0' # rubocop:disable Gemspec/DevelopmentDependencies

  s.metadata['rubygems_mfa_required'] = 'true'
end
