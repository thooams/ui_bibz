# frozen_string_literal: true

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
  class MultiColumnField < UiBibz::Ui::Core::Forms::Selects::AbstractSelect
    # See UiBibz::Ui::Core::Component.initialize

    private

    def component_html_data
      super
      searchable
      selectable_opt_group
    end

    def component_html_classes
      super << 'multi-column-field'
    end

    def component_html_options
      super.merge({
                    multiple: true,
                    disabled: options[:state] == :disabled,
                    include_blank: options[:include_blank],
                    prompt: options[:prompt]
                  })
    end

    def searchable
      @data_html_options_builder.add('searchable', value: options[:searchable])
    end

    def selectable_opt_group
      @data_html_options_builder.add('selectable_optgroup', value: options[:selectable_opt_group])
    end

    def status
      "has-#{options[:status]}" if options[:status]
    end
  end
end
