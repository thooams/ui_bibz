require 'action_view/helpers/tag_helper'
require 'action_view/helpers/text_helper'
require 'action_view/helpers/capture_helper'
require 'action_view/helpers/url_helper'
require 'action_view'
require 'haml/helpers'
require 'will_paginate'

module UiBibz
  module Ui
    autoload :Component, "ui-bibz/ui/component"
    autoload :Ui, "ui-bibz/ui/ui"
    autoload :Nav, "ui-bibz/ui/nav"
    autoload :Panel, "ui-bibz/ui/panel"
    autoload :Tab, "ui-bibz/ui/tab"
    autoload :Store, "ui-bibz/ui/store"
    autoload :Column, "ui-bibz/ui/column"
    autoload :Grid, "ui-bibz/ui/grid"
    autoload :Dropdown, "ui-bibz/ui/dropdown"
    autoload :DropdownButton, "ui-bibz/ui/dropdown_button"
  end

  module Helpers
    autoload :UiHelper,   "ui-bibz/helpers/ui_helper"
    autoload :MetaHelper, "ui-bibz/helpers/meta_helper"
  end
end


require "ui-bibz/rails/engine"
