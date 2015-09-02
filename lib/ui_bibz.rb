require 'action_view'
require 'will_paginate'
require 'will-paginate-i18n'

module UiBibz

  mattr_accessor :app_root

  module Ui
    # Base
    autoload :Base,                    "ui_bibz/ui/base"

    # Core
    module Core
      autoload :Alert,                   "ui_bibz/ui/core/alert"
      autoload :Breadcrumb,              "ui_bibz/ui/core/breadcrumb/breadcrumb"
      autoload :Button,                  "ui_bibz/ui/core/button/button"
      autoload :ButtonCheckbox,          "ui_bibz/ui/core/button/button_checkbox"
      autoload :ButtonDropdown,          "ui_bibz/ui/core/button/button_dropdown"
      autoload :ButtonGroup,             "ui_bibz/ui/core/button/button_group"
      autoload :ButtonLink,              "ui_bibz/ui/core/button/button_link"
      autoload :ButtonSplitDropdown,     "ui_bibz/ui/core/button/button_split_dropdown"
      autoload :Col,                     "ui_bibz/ui/core/col"
      autoload :Component,               "ui_bibz/ui/core/component"
      autoload :Container,               "ui_bibz/ui/core/container"
      autoload :Dropdown,                "ui_bibz/ui/core/dropdown/dropdown"
      autoload :Glyph,                   "ui_bibz/ui/core/glyph"
      autoload :Jumbotron,               "ui_bibz/ui/core/jumbotron"
      autoload :Label,                   "ui_bibz/ui/core/label"
      autoload :ListGroup,               "ui_bibz/ui/core/list/list_group"
      autoload :Nav,                     "ui_bibz/ui/core/nav/nav"
      autoload :Navbar,                  "ui_bibz/ui/core/nav/navbar"
      autoload :Panel,                   "ui_bibz/ui/core/panel"
      autoload :ProgressBar,             "ui_bibz/ui/core/progress_bar/progress_bar"
      autoload :Row,                     "ui_bibz/ui/core/row"
      autoload :Stars,                   "ui_bibz/ui/core/stars"
      autoload :Tab,                     "ui_bibz/ui/core/nav/tab"
    end

    # Ux
    module Ux
      autoload :Grid,                    "ui_bibz/ui/ux/grid"
      autoload :Table,                   "ui_bibz/ui/ux/table/table"
      autoload :TablePanel,              "ui_bibz/ui/ux/table/table_panel"
      autoload :TableSearchField,        "ui_bibz/ui/ux/table/table_search_field"
      autoload :TablePagination,         "ui_bibz/ui/ux/table/table_pagination"
      autoload :TablePaginationPerPage,  "ui_bibz/ui/ux/table/table_pagination_per_page"
    end
  end

  module Helpers
    autoload :MetaHelper,   "ui_bibz/helpers/meta_helper"
    autoload :UiCoreHelper, "ui_bibz/helpers/ui_core_helper"
    autoload :UiUxHelper,   "ui_bibz/helpers/ui_ux_helper"
    autoload :UtilsHelper,  "ui_bibz/helpers/utils_helper"
  end

  module Concerns
    module Models
      autoload :Searchable, "ui_bibz/concerns/models/searchable"
    end
  end

end

require "ui_bibz/rails/engine"
