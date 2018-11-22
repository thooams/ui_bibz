require 'rails/generators'
module UiBibz
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates Ui Bibz initializer for your application"

      def copy_initializer
        template "ui_bibz_initializer.rb", "config/initializers/ui_bibz.rb"

        puts "Install complete in config/initializers/ui_bibz.rb. Now you can configure the library!"
      end
    end
  end
end

