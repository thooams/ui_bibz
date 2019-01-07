require 'action_view'
require 'will_paginate'
require 'will-paginate-i18n'

module UiBibzForm

  autoload :UiBibzFormBuilder, "ui_bibz/inputs/ui_bibz_form/ui_bibz_form_builder"

end

module UiBibzInputs

  autoload :BaseInput,                  "ui_bibz/inputs/ui_bibz_inputs/base_input"
  autoload :CollectionInput,            "ui_bibz/inputs/ui_bibz_inputs/collection_input"
  autoload :StringInput,                "ui_bibz/inputs/ui_bibz_inputs/string_input"
  autoload :UiAutoCompleteFieldInput,   "ui_bibz/inputs/ui_bibz_inputs/ui_auto_complete_field_input"
  autoload :UiChoiceGroupInput,         "ui_bibz/inputs/ui_bibz_inputs/ui_choice_group_input"
  autoload :UiDatePickerFieldInput,     "ui_bibz/inputs/ui_bibz_inputs/ui_date_picker_field_input"
  autoload :UiDropdownSelectFieldInput, "ui_bibz/inputs/ui_bibz_inputs/ui_dropdown_select_field_input"
  autoload :UiFormulaFieldInput,        "ui_bibz/inputs/ui_bibz_inputs/ui_formula_field_input"
  autoload :UiMarkdownEditorFieldInput, "ui_bibz/inputs/ui_bibz_inputs/ui_markdown_editor_field_input"
  autoload :UiMultiColumnFieldInput,    "ui_bibz/inputs/ui_bibz_inputs/ui_multi_column_field_input"
  autoload :UiMultiSelectFieldInput,    "ui_bibz/inputs/ui_bibz_inputs/ui_multi_select_field_input"
  autoload :UiNumberFieldInput,         "ui_bibz/inputs/ui_bibz_inputs/ui_number_field_input"
  autoload :UiRadioFieldInput,          "ui_bibz/inputs/ui_bibz_inputs/ui_radio_field_input"
  autoload :UiSelectFieldInput,         "ui_bibz/inputs/ui_bibz_inputs/ui_select_field_input"
  autoload :UiBoxSwitchFieldInput,      "ui_bibz/inputs/ui_bibz_inputs/ui_box_switch_field_input"
  #autoload :UiSwitchFieldInput,         "ui_bibz/inputs/ui_bibz_inputs/ui_switch_field_input"
  autoload :UiTextFieldInput,           "ui_bibz/inputs/ui_bibz_inputs/ui_text_field_input"

end

module UiBibz

  @@configured = false

  # Configuration of Ui Bibz
  class << self
    attr_accessor :configuration
  end

  def self.configured? #:nodoc:
    @@configured
  end

  def self.configure
    self.configuration ||= Configuration.new
    @@configured = true
    yield(configuration)
  end

  class Configuration
    attr_accessor :fontawesomejs

    def initialize
      @fontawesomejs = true
    end
  end

  mattr_accessor :app_root

  # Add modules
  module Utils
    autoload :Screwdriver,             "ui_bibz/utils/screwdriver"
    autoload :GlyphChanger,            "ui_bibz/utils/glyph_changer"
  end

  module Ui
    # Base
    autoload :Base,                    "ui_bibz/ui/base"

    # Core
    module Core

      module Boxes
        autoload :Card,                    "ui_bibz/ui/core/boxes/card"
        autoload :CardColumn,              "ui_bibz/ui/core/boxes/card_column"
        autoload :CardDeck,                "ui_bibz/ui/core/boxes/card_deck"
        autoload :CardGroup,               "ui_bibz/ui/core/boxes/card_group"
        autoload :Jumbotron,               "ui_bibz/ui/core/boxes/jumbotron"
      end

      module Forms

        module Dropdowns
          autoload :Dropdown,                "ui_bibz/ui/core/forms/dropdowns/dropdown"
          autoload :SplitDropdown,           "ui_bibz/ui/core/forms/dropdowns/split_dropdown"
        end

        module Dates
          autoload :DatePickerField,         "ui_bibz/ui/core/forms/dates/date_picker_field"
        end

        module Choices
          autoload :SwitchField,             "ui_bibz/ui/core/forms/choices/switch_field"
          autoload :BoxSwitchField,          "ui_bibz/ui/core/forms/choices/box_switch_field"
          autoload :CheckboxField,           "ui_bibz/ui/core/forms/choices/checkbox_field"
          autoload :RadioField,              "ui_bibz/ui/core/forms/choices/radio_field"
          autoload :ChoiceGroup,             "ui_bibz/ui/core/forms/choices/choice_group"
        end

        module Numbers
          autoload :FormulaField,            "ui_bibz/ui/core/forms/numbers/formula_field"
          autoload :NumberField,             "ui_bibz/ui/core/forms/numbers/number_field"
          autoload :RangeField,              "ui_bibz/ui/core/forms/numbers/range_field"
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
          autoload :ButtonGroup,             "ui_bibz/ui/core/forms/buttons/button_group"
          autoload :ButtonLink,              "ui_bibz/ui/core/forms/buttons/button_link"
          autoload :ButtonRefresh,           "ui_bibz/ui/core/forms/buttons/button_refresh"
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

      module Icons
        autoload :Glyph,                   "ui_bibz/ui/core/icons/glyph"
        autoload :GlyphGroup,              "ui_bibz/ui/core/icons/glyph_group"
        autoload :Star,                    "ui_bibz/ui/core/icons/star"
      end

      module Layouts
        autoload :Row,                     "ui_bibz/ui/core/layouts/row"
        autoload :Col,                     "ui_bibz/ui/core/layouts/col"
        autoload :Container,               "ui_bibz/ui/core/layouts/container"
      end

      module Lists
        autoload :ListGroup,              "ui_bibz/ui/core/lists/list_group"
        autoload :List,                   "ui_bibz/ui/core/lists/components/list"
      end

      module Navigations
        autoload :Breadcrumb,              "ui_bibz/ui/core/navigations/breadcrumb"
        autoload :Link,                    "ui_bibz/ui/core/navigations/link"
        autoload :Nav,                     "ui_bibz/ui/core/navigations/nav"
        autoload :Navbar,                  "ui_bibz/ui/core/navigations/navbar"
        autoload :Pagination,              "ui_bibz/ui/core/navigations/pagination"
        autoload :TabGroup,                "ui_bibz/ui/core/navigations/tab_group"
        autoload :Toolbar,                 "ui_bibz/ui/core/navigations/toolbar"
      end

      module Notifications
        autoload :Alert,                   "ui_bibz/ui/core/notifications/alert"
        autoload :Badge,                   "ui_bibz/ui/core/notifications/badge"
        autoload :ProgressBar,             "ui_bibz/ui/core/notifications/progress_bar"
      end

      module Windows
        autoload :Modal,                  "ui_bibz/ui/core/windows/modal"
      end

      # Other section
      autoload :Component,               "ui_bibz/ui/core/component"
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

      module Containers
        autoload :Panel,  "ui_bibz/ui/ux/containers/panel"
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
