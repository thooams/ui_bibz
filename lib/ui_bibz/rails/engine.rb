# frozen_string_literal: true

# to load pagination in rails app
require 'will_paginate' if Gem.loaded_specs.key?('will_paginate')
require 'simple_form' if Gem.loaded_specs.key?('simple_form')

module UiBibz
  module Rails
    class Engine < ::Rails::Engine
      initializer 'ui_bibz.helpers' do
        ActionView::Base.include UiBibz::Helpers::UtilsHelper
      end

      initializer 'ui_bibz.helpers.ui' do
        ActionView::Base.include UiBibz::Helpers::Ui::CoreHelper
        ActionView::Base.include UiBibz::Helpers::Ui::UxHelper
      end

      config.autoload_paths += Dir["#{config.root}/lib/ui_bibz/inputs/"] if defined?(::SimpleForm)

      initializer 'ui_bibz.helpers.form' do
        ActionView::Base.include UiBibzForm
      end

      initializer 'ui_bibz.assets' do |app|
        %w(stylesheets javascripts fonts images).each do |sub|
          app.config.assets.paths << root.join('assets', sub).to_s
          app.config.assets.paths << root.join('vendor/assets', sub).to_s
        end
      end

      initializer "ui_bibz.importmap", before: "importmap" do |app|
        app.config.importmap.paths << Engine.root.join("config/importmap.rb")
      end

      initializer "ui_bibz.assets.precompile" do |app|
        app.config.assets.precompile += %w(bootstrap.min.js popper.js
jquery-3.7.0.min.js bootstrap-multiselect.min.js jquery.multi-select.min.js")
      end
    end
  end
end
