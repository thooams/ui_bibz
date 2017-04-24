module UiBibz::Ui::Core::Forms::Selects

  # Create a MultiSelectField
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
  # * +clickable_opt_group+ - Boolean
  # * +collapsible_opt_group+ - Boolean
  # * +searchable+ - Boolean
  # * +select_all_option+ - Boolean
  # * +append+ - String, Html
  # * +prepend+ - String, Html
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
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new('fruits', { option_tags: list_of_fruits, searchable: true }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiSelectField.new({ option_tags: list_of_fruits, select_all_option: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   multi_select_field(content, options = {}, html_options = {})
  #
  class MultiSelectField < UiBibz::Ui::Core::Forms::Selects::AbstractSelect

    # See UiBibz::Ui::Core::Forms::Buttons::Button.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    private

    def component_html_options
      super.merge({
        multiple:      true,
        disabled:      options[:state] == :disabled,
        include_blank: false,
        prompt:        false,
      })
    end

    def component_html_classes
      super << [size, type, status, 'multi-select-field']
    end

    def component_html_data
      super
      clickable_opt_group
      collapsible_opt_group
      searchable
      select_all_option
    end

    def clickable_opt_group
      add_html_data('enable_clickable_opt_groups') if options[:clickable_opt_group]
    end

    def collapsible_opt_group
      add_html_data('enable_collapsible_opt_groups') if options[:collapsible_opt_group]
    end

    def searchable
      add_html_data('enable_filtering') if options[:searchable]
    end

    def select_all_option
      add_html_data('include_select_all_option') if options[:select_all_option]
    end

    def status
      options[:status].nil? ? 'btn-secondary' : "btn-#{ options[:status] }"
    end

    def type
      "btn-block" if options[:type] == :block
    end

    # :lg, :sm or :xs
    def size
      "btn-#{ options[:size] }" if options[:size]
    end

  end
end
