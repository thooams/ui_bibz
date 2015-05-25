require 'action_view'
require 'will_paginate'
require 'will-paginate-i18n'

module UiBibz

  mattr_accessor :app_root

  module Ui
    autoload :Alert,                   "ui_bibz/ui/alert"
    autoload :Base,                    "ui_bibz/ui/base"
    autoload :Breadcrumb,              "ui_bibz/ui/breadcrumb/breadcrumb"
    autoload :Button,                  "ui_bibz/ui/button/button"
    autoload :ButtonDropdown,          "ui_bibz/ui/button/button_dropdown"
    autoload :ButtonGroup,             "ui_bibz/ui/button/button_group"
    autoload :ButtonLink,              "ui_bibz/ui/button/button_link"
    autoload :ButtonSplitDropdown,     "ui_bibz/ui/button/button_split_dropdown"
    autoload :Col,                     "ui_bibz/ui/grid/components/col"
    autoload :Component,               "ui_bibz/ui/component"
    autoload :Dropdown,                "ui_bibz/ui/dropdown/dropdown"
    autoload :Glyph,                   "ui_bibz/ui/glyph"
    autoload :Grid,                    "ui_bibz/ui/grid/grid"
    autoload :Jumbotron,               "ui_bibz/ui/jumbotron"
    autoload :Label,                   "ui_bibz/ui/label"
    autoload :ListGroup,               "ui_bibz/ui/list/list_group"
    autoload :Nav,                     "ui_bibz/ui/nav/nav"
    autoload :Panel,                   "ui_bibz/ui/panel"
    autoload :ProgressBar,             "ui_bibz/ui/progress_bar/progress_bar"
    autoload :Row,                     "ui_bibz/ui/grid/components/row"
    autoload :Tab,                     "ui_bibz/ui/nav/tab"
    autoload :Table,                   "ui_bibz/ui/table/table"
    autoload :TablePanel,              "ui_bibz/ui/table/table_panel"
    autoload :TableSearchField,        "ui_bibz/ui/table/table_search_field"
    autoload :TablePagination,         "ui_bibz/ui/table/table_pagination"
    autoload :TablePaginationPerPage,  "ui_bibz/ui/table/table_pagination_per_page"
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
