module UiBibz::Ui::Core

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
  # * option_tags - Array, Object [required]
  # * selectable_opt_group - Boolean
  # * searchable - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::MultiColumnField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::MultiColumnField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::MultiColumnField.new('fruits', { option_tags: list_of_fruits, searchable: true }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::MultiColumnField.new({ option_tags: list_of_fruits, selectable_opt_group: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   multi_column_field(content, options = {}, html_options = {})
  #
  class MultiColumnField < Component

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
      searchable
      selectable_opt_group
    end

    def component_html_classes
      'multi-column'
    end

    def component_html_options
      { multiple: true }
    end

    def searchable
      add_html_data('searchable') if options[:searchable]
    end

    def selectable_opt_group
      add_html_data('selectable_optgroup') if options[:selectable_opt_group]
    end

  end
end
