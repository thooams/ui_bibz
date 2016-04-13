# to load pagination in rails app
require 'will_paginate'
require 'bootstrap'
require "font-awesome-sass"

# Javascript requires
require 'rails-assets-tether'
require 'rails-assets-bootstrap-datepicker'
require 'rails-assets-bootstrap-select'
#
# not compatible with boostrap 4
#require 'rails-assets-bootstrap-switch'
#require 'rails-assets-bootstrap-multiselect'

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
