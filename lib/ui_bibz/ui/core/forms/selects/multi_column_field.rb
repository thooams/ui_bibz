module UiBibz::Ui::Core::Forms::Selects

  # Create a MultiColumnField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
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
  # * +selectable_opt_group+ - Boolean
  # * +searchable+ - Boolean
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
  #   UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new('fruits', { option_tags: list_of_fruits, searchable: true }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Selects::MultiColumnField.new({ option_tags: list_of_fruits, selectable_opt_group: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   multi_column_field(content, options = {}, html_options = {})
  #
  class MultiColumnField < UiBibz::Ui::Core::ConnectedComponent

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      select_tag content, options[:option_tags], html_options
    end

    private

    def component_html_data
      super
      searchable
      selectable_opt_group
      connect_options
    end

    def component_html_classes
      'multi-column'
    end

    def component_html_options
      opts = { multiple: true }
      opts = opts.merge({ disabled: true })            if options[:state] == :disabled
      opts = opts.merge({ include_blank: true})        if options[:include_blank]
      opts = opts.merge({ prompt: options[:prompt] })  unless options[:prompt].blank?
      opts
    end

    def searchable
      add_html_data('searchable') if options[:searchable]
    end

    def selectable_opt_group
      add_html_data('selectable_optgroup') if options[:selectable_opt_group]
    end

    def status
      "has-#{ options[:status] }" if options[:status]
    end

  end
end
