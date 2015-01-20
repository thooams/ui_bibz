require 'action_view'
#require 'haml/helpers'
require 'will_paginate'

module UiBibz

  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  # Maybe remove ?
  def self.setup
    yield self
  end

  module Ui
    autoload :Component, "ui_bibz/ui/component"
    autoload :Ui, "ui_bibz/ui/ui"
    autoload :Nav, "ui_bibz/ui/nav"
    autoload :Panel, "ui_bibz/ui/panel"
    autoload :Tab, "ui_bibz/ui/tab"
    autoload :Store, "ui_bibz/ui/store"
    autoload :Column, "ui_bibz/ui/column"
    autoload :Grid, "ui_bibz/ui/grid"
    autoload :Dropdown, "ui_bibz/ui/dropdown"
    autoload :DropdownButton, "ui_bibz/ui/dropdown_button"
  end

  module Helpers
    autoload :UiHelper,   "ui_bibz/helpers/ui_helper"
    autoload :MetaHelper, "ui_bibz/helpers/meta_helper"
  end
end


require "ui_bibz/rails/engine"
