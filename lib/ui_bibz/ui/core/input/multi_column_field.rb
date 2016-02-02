module UiBibz::Ui::Core

  # Create a multiSelect
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
  # * searchable - Boolean
  # * selectable_opt_group - Boolean
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
  #   UiBibz::Ui::Core::MultiColumnField.new({num: 2, offset: 1, size: 3}, class: 'test') do
  #     #content
  #   end
  #
  #   UiBibz::Ui::Core::MultiColumnField.new([{num: 2, offset: 1, size: 3}, { num: 3}], class: 'test') do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   multi_column_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class MultiColumnField < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @html_options = class_and_html_options('multi-column').merge({ multiple: true })
    end

    # Render html tag
    def render
      select_tag @content, @options[:option_tags], @html_options
    end

    private

    def add_data_html_options
      searchable
      selectable_opt_group
    end

    def searchable
      add_html_data('searchable') if @options[:searchable]
    end

    def selectable_opt_group
      add_html_data('selectable_optgroup') if @options[:selectable_opt_group]
    end

  end
end
