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


      # Card section
      module Cards
        autoload :Card,                    "ui_bibz/ui/core/cards/card"
        autoload :CardColumn,              "ui_bibz/ui/core/cards/card_column"
        autoload :CardDeck,                "ui_bibz/ui/core/cards/card_deck"
        autoload :CardGroup,               "ui_bibz/ui/core/cards/card_group"
      end

      # Input section
      module Inputs
        module Texts
          autoload :AutocompleteField,       "ui_bibz/ui/core/inputs/texts/autocomplete_field"
          autoload :SurroundField,           "ui_bibz/ui/core/inputs/texts/surround_field"
        end

        module Textareas
          autoload :MarkdownEditorField,     "ui_bibz/ui/core/inputs/textareas/markdown_editor_field"
        end

        module Numbers
          autoload :FormulaField,            "ui_bibz/ui/core/inputs/numbers/formula_field"
        end

        module Dates
          autoload :DatePickerField,         "ui_bibz/ui/core/inputs/dates/date_picker_field"
        end

        module Selects
          autoload :DropdownSelectField,     "ui_bibz/ui/core/inputs/selects/dropdown_select_field"
          autoload :MultiColumnField,        "ui_bibz/ui/core/inputs/selects/multi_column_field"
          autoload :MultiSelectField,        "ui_bibz/ui/core/inputs/selects/multi_select_field"
        end

        module Buttons
          autoload :Button,                  "ui_bibz/ui/core/inputs/buttons/button"
          autoload :ButtonChoice,            "ui_bibz/ui/core/inputs/buttons/button_choice"
          autoload :ButtonDropdown,          "ui_bibz/ui/core/inputs/buttons/button_dropdown"
          autoload :ButtonGroup,             "ui_bibz/ui/core/inputs/buttons/button_group"
          autoload :ButtonLink,              "ui_bibz/ui/core/inputs/buttons/button_link"
          autoload :ButtonSplitDropdown,     "ui_bibz/ui/core/inputs/buttons/button_split_dropdown"
        end

        autoload :SwitchField,             "ui_bibz/ui/core/inputs/switch_field"
        autoload :Checkbox,                "ui_bibz/ui/core/inputs/checkbox"
      end

      # Layout section
      module Layouts
        autoload :Row,                     "ui_bibz/ui/core/layouts/row"
        autoload :Col,                     "ui_bibz/ui/core/layouts/col"
        autoload :Container,               "ui_bibz/ui/core/layouts/container"
      end

      # Nav section
      module Navs
        autoload :Nav,                     "ui_bibz/ui/core/navs/nav"
        autoload :Navbar,                  "ui_bibz/ui/core/navs/navbar"
      end

      # Other section
      autoload :Alert,                   "ui_bibz/ui/core/alert"
      autoload :Breadcrumb,              "ui_bibz/ui/core/breadcrumb/breadcrumb"
      autoload :Component,               "ui_bibz/ui/core/component"
      autoload :Dropdown,                "ui_bibz/ui/core/dropdown/dropdown"
      autoload :Glyph,                   "ui_bibz/ui/core/glyph"
      autoload :Jumbotron,               "ui_bibz/ui/core/jumbotron"
      autoload :Tag,                     "ui_bibz/ui/core/tag"
      autoload :ListGroup,               "ui_bibz/ui/core/list/list_group"
      autoload :Modal,                   "ui_bibz/ui/core/modal/modal"
      autoload :Progress,                "ui_bibz/ui/core/progress"
      autoload :Stars,                   "ui_bibz/ui/core/stars"
      autoload :Tab,                     "ui_bibz/ui/core/nav/tab"
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
