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
    end
  end
end
