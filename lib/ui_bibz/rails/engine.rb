# to load pagination in rails app
require 'will_paginate'
require 'bootstrap'
require 'rails-assets-tether'
require 'rails-assets-bootstrap-select'
require "font-awesome-sass"

module UiBibz
  module Rails
    class Engine < ::Rails::Engine

      initializer "ui_bibz.helpers" do
        ActionView::Base.send :include, UiBibz::Helpers::UiCoreHelper
        ActionView::Base.send :include, UiBibz::Helpers::UiUxHelper
        ActionView::Base.send :include, UiBibz::Helpers::UtilsHelper
      end

    end
  end
end
