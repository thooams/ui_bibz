# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Selects
  # Create a DropdownSelectField
  #
  # This element is an extend of UiBibz::Ui::Core::Forms::Buttons::Button
  # source : http://loudev.com/
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
  # * +option_tags+ - Array, Object [required]
  # * +multiple+ - Boolean
  # * +outline+ - Boolean
  # * +theme+ - String
  # * +clickable_opt_group+ - Boolean
  # * +collapsible_opt_group+ - Boolean
  # * +searchable+ - Boolean
  # * +select_all_option+ - Boolean
  # * +append+ - String, Html
  # * +non_selected_text+ - String
  # * +open+ - Boolean
  # * +theme+ - Symbol, defaut: +:dark+
  # * +prepend+ - String, Html
  # * +position+ - Symbol
  #   (+:up+, +:right+, +:down+, +:left+)
  # * +alignment+ - Symbol
  #   (+:right)
  # * +connect+ - Hash
  #   * +event+ - String
  #   * +mode+ - String
  #   * +target+ - Hash
  #     * +selector+ - String
  #     * +data+ - Array
  #     * +url+ - String
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
  #   UiBibz::Ui::Core::Forms::Selects::DropdownSelectField.new({ option_tags: list_of_fruits, select_all_option: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   dropdown_select_field(content, options = {}, html_options = {})
  #
  class DropdownSelectField < UiBibz::Ui::Core::Forms::Selects::AbstractSelect
    # See UiBibz::Ui::Core::Forms::Buttons::Button.initialize

    private

    def component_html_options
      super.merge({
                    multiple: options[:multiple],
                    disabled: options[:state] == :disabled
                    # include_blank: false,
                    # prompt: false
                  })
    end

    def component_html_classes
      [open, size, type, button_status, 'multi-select-field']
    end

    def component_html_data
      super
      clickable_opt_group
      collapsible_opt_group
      searchable
      non_selected_text
      select_all_options
      number_displayed
      dropdown_menu_classes
      dropdown_classes
      n_selected_text
    end

    def clickable_opt_group
      @data_html_options_builder.add('enable_clickable_opt_groups', value: options[:clickable_opt_group])
    end

    def collapsible_opt_group
      @data_html_options_builder.add('enable_collapsible_opt_groups', value: options[:collapsible_opt_group])
    end

    def searchable
      @data_html_options_builder.add('enable_filtering') if options[:searchable]
      @data_html_options_builder.add('fuzzy_search') if options[:searchable] == :fuzzy
    end

    def n_selected_text
      @data_html_options_builder.add('n_selected_text', value: options[:n_selected_text])
    end

    def number_displayed
      @data_html_options_builder.add('number_displayed', value: options[:number_displayed])
    end

    def select_all_options
      @data_html_options_builder.add('include_select_all_option', value: options[:select_all_options])
    end

    def non_selected_text
      @data_html_options_builder.add('non_selected_text', value: options[:non_selected_text])
    end

    def dropdown_menu_classes
      classes = join_classes(theme, alignment, open)
      @data_html_options_builder.add('dropdown_menu_classes', value: classes.nil? ? nil : classes.join(' '))
    end

    def dropdown_classes
      classes = join_classes(position, open)
      @data_html_options_builder.add('dropdown_classes', value: classes.nil? ? nil : classes.join(' '))
    end

    def position
      "drop#{@options[:position] || 'down'}"
    end

    def theme
      'dropdown-menu-dark' if @options[:theme]
    end

    def open
      'show' if @options[:open]
    end

    def alignment
      "dropdown-menu-#{@options[:alignment]}" unless @options[:alignment].nil?
    end

    def type
      'btn-block' if options[:type] == :block
    end

    # :lg, :sm or :xs
    def size
      "btn-#{options[:size]}" if options[:size]
    end

    def button_status
      ['btn', outline, options[:status] || :secondary].compact.join('-')
    end

    def outline
      'outline' if options[:outline]
    end
  end
end
