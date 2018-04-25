# to load pagination in rails app
require 'will_paginate'
require 'jquery-rails'
require 'popper_js'
require 'bootstrap'
require "font-awesome-sass"
require 'simple_form' if system('gem list -i simple_form')

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
        #Dir["#{config.root}/lib/ui_bibz/inputs/**/**"].each{ |b| require b } if defined?(::SimpleForm)
      end


    end
  end
end
