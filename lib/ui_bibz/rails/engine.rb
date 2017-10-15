# to load pagination in rails app
require 'will_paginate'
require 'jquery-rails'
require 'popper_js'
require 'bootstrap'
require "font-awesome-sass"

# Javascript requires
#require 'rails-assets-tether'
#require 'rails-assets-bootstrap-datepicker'
#require 'rails-assets-bootstrap-select'
#
# not compatible with boostrap 4
#require 'rails-assets-bootstrap-switch'
#require 'rails-assets-bootstrap-multiselect'

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

    end
  end
end
