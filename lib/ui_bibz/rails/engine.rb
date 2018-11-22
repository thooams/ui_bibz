# to load pagination in rails app
require 'will_paginate'
require 'jquery-rails'
require 'popper_js'
require 'bootstrap'
require 'simple_form' if system('gem list -i simple_form', :out => File::NULL)

module UiBibz
  module Rails
    class Engine < ::Rails::Engine

      initializer "ui_bibz.helpers" do
        ActionView::Base.send :include, UiBibz::Helpers::UtilsHelper
      end

      initializer "ui_bibz.helpers.ui" do
        ActionView::Base.send :include, UiBibz::Helpers::Ui::CoreHelper
        ActionView::Base.send :include, UiBibz::Helpers::Ui::UxHelper
      end

      config.autoload_paths += Dir["#{config.root}/lib/ui_bibz/inputs/**/"] if defined?(::SimpleForm)

      initializer "ui_bibz.helpers.form" do
        ActionView::Base.send :include, UiBibzForm
      end

      initializer 'font-awesome-sass.assets.precompile', group: :all do |app|
        config.assets.precompile << /\.(?:svg|eot|woff|woff2|ttf)\z/
      end

      config.after_initialize do
        unless UiBibz.configured?
          warn '[Ui Bibz] Ui Bibz is not configured in the application and will use the default values.' + ' Use `rails generate ui_bibz:install` to generate the Ui Bibz configuration.'
        end
      end

    end

  end
end

