module UiBibz::Ui::Core::Forms::Selects

  # Create a DropdownSelectField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # source : http://silviomoreto.github.io/bootstrap-select/examples/
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+, +:link+)
  # * option_tags - Array, Object [required]
  # * searchable - Boolean
  # * max_options - Integer
  # * selected_text_format - String
  # * menu_size - Integer
  # * header - String
  # * actions_box - Boolean
  # * show_tick - Boolean
  # * show_menu_arrow - Boolean
  # * dropup - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new('fruits', { option_tags: list_of_fruits, searchable: true }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new({ option_tags: list_of_fruits, actions_box: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   dropdown_select_field(content, options = {}, html_options = {})
  #
  class DropdownSelectField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      select_tag content, options[:option_tags], html_options
    end

    private

    def component_html_classes
      ['selectpicker', show_tick, show_menu_arrow, dropup]
    end

    def component_html_data
      searchable
      max_options
      selected_text_format
      menu_size
      style
      header
      actions_box
    end

    def component_html_options
      options[:state] == :disabled ? { disabled: 'disabled' } : {}
    end

    ############################ Data html options

    def max_options
      add_html_data('max_options', options[:max_options]) if options[:max_options]
    end

    def selected_text_format
      add_html_data('selected_text_format', options[:selected_text_format]) if options[:selected_text_format]
    end

    def searchable
      add_html_data('live_search') if options[:searchable]
    end

    def style
      add_html_data('style', "btn-#{ options[:status]}") if options[:style]
    end

    def menu_size
      add_html_data('size', options[:menu_size]) if options[:menu_size]
    end

    def actions_box
      add_html_data('actions_box') if options[:actions_box]
    end

    def header
      add_html_data('header', options[:header]) if options[:header]
    end


    ############################# Css classes

    def show_tick
      'show-tick' if options[:show_tick]
    end

    def show_menu_arrow
      'show-menu-arrow' if options[:show_menu_arrow]
    end

    def dropup
      'dropup' if options[:dropup]
    end

  end
end
