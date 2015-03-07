# to load pagination in rails app
require 'will_paginate'

module UiBibz
  module Rails
    class Engine < ::Rails::Engine

      initializer "ui_bibz.helpers" do
        ActionView::Base.send :include, UiBibz::Helpers::UiHelper
        ActionView::Base.send :include, UiBibz::Helpers::UtilsHelper
        ActionView::Base.send :include, UiBibz::Helpers::MetaHelper
      end

      #initializer 'ui_bibz.include_concerns' do
      #  #ActiveRecord::Base.send :include, UiBibz::Concerns::Models
      #  ActionDispatch::Reloader.to_prepare do
      #    ActionDispatch::Base.send :include, UiBibz::Concerns::Models
      #    #ActionDispatch::Base.send :include, UiBibz::Concerns::Models
      #  end
      #end

      # Autoload from lib directory
      #config.autoload_paths << File.expand_path('../../', __FILE__)

      # # Maybe remove ?
      # initializer "ui_bibz.load_app_instance_data" do |app|
      #   UiBibz.setup do |config|
      #     config.app_root = app.root
      #   end
      # end

      # # Maybe remove ?
      # initializer "ui_bibz.load_static_assets" do |app|
      #   app.middleware.use ::ActionDispatch::Static, "#{root}/public"
      # end

    end
  end
end
