require 'action_view'
require 'will_paginate'
require 'will-paginate-i18n'

module UiBibz

  mattr_accessor :app_root

  module Utils
    autoload :Screwdriver,             "ui_bibz/utils/screwdriver"
  end

  module Ui
    # Base
    autoload :Base,                    "ui_bibz/ui/base"

    # Core
    module Core

      module Navigations
        autoload :Nav,                     "ui_bibz/ui/core/navigations/nav"
        autoload :Navbar,                  "ui_bibz/ui/core/navigations/navbar"
        autoload :Pagination,              "ui_bibz/ui/core/navigations/pagination"
        autoload :Toolbar,                 "ui_bibz/ui/core/navigations/toolbar"
      end

      module Cards
        autoload :Card,                    "ui_bibz/ui/core/cards/card"
        autoload :CardColumn,              "ui_bibz/ui/core/cards/card_column"
        autoload :CardDeck,                "ui_bibz/ui/core/cards/card_deck"
        autoload :CardGroup,               "ui_bibz/ui/core/cards/card_group"
      end

      module Dropdowns
        autoload :Dropdown,                "ui_bibz/ui/core/dropdowns/dropdown"
        autoload :SplitDropdown,           "ui_bibz/ui/core/dropdowns/split_dropdown"
      end

      module Forms

        module Dates
          autoload :DatePickerField,         "ui_bibz/ui/core/forms/dates/date_picker_field"
        end

        module Choices
          autoload :SwitchField,             "ui_bibz/ui/core/forms/choices/switch_field"
          autoload :CheckboxField,           "ui_bibz/ui/core/forms/choices/checkbox_field"
          autoload :RadioField,              "ui_bibz/ui/core/forms/choices/radio_field"
        end

        module Numbers
          autoload :FormulaField,            "ui_bibz/ui/core/forms/numbers/formula_field"
        end

        module Selects
          autoload :AbstractSelect,          "ui_bibz/ui/core/forms/selects/abstract_select"
          autoload :DropdownSelectField,     "ui_bibz/ui/core/forms/selects/dropdown_select_field"
          autoload :SelectField,             "ui_bibz/ui/core/forms/selects/select_field"
          autoload :MultiColumnField,        "ui_bibz/ui/core/forms/selects/multi_column_field"
          autoload :MultiSelectField,        "ui_bibz/ui/core/forms/selects/multi_select_field"
        end

        module Buttons
          autoload :Button,                  "ui_bibz/ui/core/forms/buttons/button"
          autoload :ButtonChoice,            "ui_bibz/ui/core/forms/buttons/button_choice"
          autoload :ButtonGroup,             "ui_bibz/ui/core/forms/buttons/button_group"
          autoload :ButtonLink,              "ui_bibz/ui/core/forms/buttons/button_link"
          autoload :ButtonRefresh,           "ui_bibz/ui/core/forms/buttons/button_refresh"
          autoload :ButtonToolbar,           "ui_bibz/ui/core/forms/buttons/button_toolbar"
        end

        module Surrounds
          autoload :SurroundField,           "ui_bibz/ui/core/forms/surrounds/surround_field"
        end

        module Texts
          autoload :AutoCompleteField,       "ui_bibz/ui/core/forms/texts/auto_complete_field"
          autoload :TextField,               "ui_bibz/ui/core/forms/texts/text_field"
        end

        module Textareas
          autoload :MarkdownEditorField,     "ui_bibz/ui/core/forms/textareas/markdown_editor_field"
        end

      end

      module Layouts
        autoload :Row,                     "ui_bibz/ui/core/layouts/row"
        autoload :Col,                     "ui_bibz/ui/core/layouts/col"
        autoload :Container,               "ui_bibz/ui/core/layouts/container"
      end

      module Lists
        autoload :ListGroup,              "ui_bibz/ui/core/lists/list_group"
      end

      # module Navs
      #   autoload :Nav,                     "ui_bibz/ui/core/navs/nav"
      #   autoload :Navbar,                  "ui_bibz/ui/core/navs/navbar"
      #   autoload :Pagination,              "ui_bibz/ui/core/navs/pagination"
      # end

      module Notifications
        autoload :Alert,                   "ui_bibz/ui/core/notifications/alert"
      end

      module Paths
        autoload :Breadcrumb,             "ui_bibz/ui/core/paths/breadcrumb"
      end

      module Progresses
        autoload :ProgressBar,            "ui_bibz/ui/core/progresses/progress_bar"
      end

      module Windows
        autoload :Modal,                  "ui_bibz/ui/core/windows/modal"
      end

      # Other section
      autoload :Component,               "ui_bibz/ui/core/component"
      autoload :Glyph,                   "ui_bibz/ui/core/glyph"
      autoload :Jumbotron,               "ui_bibz/ui/core/jumbotron"
      autoload :Badge,                   "ui_bibz/ui/core/badge"
      autoload :Progress,                "ui_bibz/ui/core/progress"
      autoload :Star,                    "ui_bibz/ui/core/star"
    end

    # Ux
    module Ux

      # Table section
      module Tables
        autoload :Table,                   "ui_bibz/ui/ux/tables/table"
        autoload :TableCard,               "ui_bibz/ui/ux/tables/table_card"
        autoload :TableSearchField,        "ui_bibz/ui/ux/tables/table_search_field"
        autoload :TablePagination,         "ui_bibz/ui/ux/tables/table_pagination"
        autoload :TablePaginationPerPage,  "ui_bibz/ui/ux/tables/table_pagination_per_page"
      end

    end
  end

  module Helpers
    module Ui
      autoload :CoreHelper,  "ui_bibz/helpers/ui/core_helper"
      autoload :UxHelper,    "ui_bibz/helpers/ui/ux_helper"
      module Core end
    end
    autoload :UtilsHelper, "ui_bibz/helpers/utils_helper"
  end

  module Concerns
    module Models
      autoload :Searchable, "ui_bibz/concerns/models/searchable"
    end
  end

end

require "ui_bibz/rails/engine"
