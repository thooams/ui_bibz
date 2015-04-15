require 'action_view'
#require 'haml/helpers'
require 'will_paginate'
require 'will-paginate-i18n'

module UiBibz

  mattr_accessor :app_root

  # Yield self on setup for nice config blocks
  # Maybe remove ?
  def self.setup
    yield self
  end

  module Ui
    autoload :Alert,                   "ui_bibz/ui/alert"
    autoload :Breadcrumb,              "ui_bibz/ui/breadcrumb/breadcrumb"
    autoload :Button,                  "ui_bibz/ui/button/button"
    autoload :ButtonGroup,             "ui_bibz/ui/button/button_group"
    autoload :ButtonLink,              "ui_bibz/ui/button/button_link"
    autoload :Component,               "ui_bibz/ui/component"
    autoload :Dropdown,                "ui_bibz/ui/dropdown/dropdown"
    #autoload :DropdownButton,          "ui_bibz/ui/dropdown_button/dropdown"
    autoload :Glyph,                   "ui_bibz/ui/glyph"
    autoload :Label,                   "ui_bibz/ui/label"
    autoload :ListGroup,               "ui_bibz/ui/list/list_group"
    autoload :Nav,                     "ui_bibz/ui/nav/nav"
    autoload :Panel,                   "ui_bibz/ui/panel"
    autoload :Tab,                     "ui_bibz/ui/nav/tab"
    autoload :Table,                   "ui_bibz/ui/table/table"
    autoload :TablePanel,              "ui_bibz/ui/table/table_panel"
    autoload :TableSearchField,        "ui_bibz/ui/table/table_search_field"
    autoload :TablePagination,         "ui_bibz/ui/table/table_pagination"
    autoload :TablePaginationPerPage,  "ui_bibz/ui/table/table_pagination_per_page"
    autoload :Ui,                      "ui_bibz/ui/ui"
  end

  module Helpers
    autoload :MetaHelper,  "ui_bibz/helpers/meta_helper"
    autoload :UiHelper,    "ui_bibz/helpers/ui_helper"
    autoload :UtilsHelper, "ui_bibz/helpers/utils_helper"
  end

  module Concerns
    module Models
      autoload :Searchable, "ui_bibz/concerns/models/searchable"
    end
  end

end


require "ui_bibz/rails/engine"
