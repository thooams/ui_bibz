# to load pagination in rails app
require 'will_paginate'

module UiBibz
  module Rails
    class Engine < ::Rails::Engine
      initializer "ui-bibz.helpers" do
        ActionView::Base.send :include, UiBibz::Helpers::UiHelper
        ActionView::Base.send :include, UiBibz::Helpers::MetaHelper
      end
    end
  end
end
