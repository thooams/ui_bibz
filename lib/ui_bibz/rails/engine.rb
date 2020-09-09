# frozen_string_literal: true

# to load pagination in rails app
require 'will_paginate'
require 'jquery-rails'
require 'popper_js'
require 'bootstrap'
require 'simple_form' if system('gem list -i simple_form', out: File::NULL)

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

      initializer 'font-awesome-sass.assets.precompile', group: :all do |app|
        %w[eot svg ttf woff woff2].each do |ext|
          app.config.assets.precompile << "fonts/fa-brands-400.#{ext}"
          app.config.assets.precompile << "fonts/fa-regular-400.#{ext}"
          app.config.assets.precompile << "fonts/fa-solid-900.#{ext}"
        end
      end

      config.after_initialize do
        warn '[Ui Bibz] Ui Bibz is not configured in the application and will use the default values. Use `rails generate ui_bibz:install` to generate the Ui Bibz configuration.' unless UiBibz.configured?
      end
    end
  end
end
