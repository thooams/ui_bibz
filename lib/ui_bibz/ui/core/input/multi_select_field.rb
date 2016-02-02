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
  #   UiBibz::Ui::Core::MultiSelectField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::MultiSelectField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::MultiSelectField.new({num: 2, offset: 1, size: 3}, class: 'test') do
  #     #content
  #   end
  #
  #   UiBibz::Ui::Core::MultiSelectField.new([{num: 2, offset: 1, size: 3}, { num: 3}], class: 'test') do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   multi_select_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class MultiSelectField < UiBibz::Ui::Core::Button

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @html_options = class_and_html_options(['btn', size, type, 'multi-select']).merge({ multiple: true })
    end

    # Render html tag
    def render
      select_tag @content, @options[:option_tags], @html_options
    end

    private

    def add_data_html_options
      clickable_opt_group
      collapsible_opt_group
      filter
      select_all_option
    end

    def clickable_opt_group
      add_html_data('enable_clickable_opt_groups') if @options[:clickable_opt_group]
    end

    def collapsible_opt_group
      add_html_data('enable_collapsible_opt_groups') if @options[:collapsible_opt_group]
    end

    def filter
      add_html_data('enable_filtering') if @options[:filter]
    end

    def select_all_option
      add_html_data('include_select_all_option') if @options[:select_all_option]
    end

  end
end
