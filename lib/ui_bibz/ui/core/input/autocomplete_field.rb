module UiBibz::Ui::Core

  # Create a AutocompleteField
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::AutocompleteField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::AutocompleteField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   options = options_for_select(2.times.map{ |i| "option #{i}" })
  #   UiBibz::Ui::Core::AutocompleteField.new('company', { option_tags: options }, { class: 'test' })
  #
  #   options = options_for_select(2.times.map{ |i| "option #{i}" })
  #   UiBibz::Ui::Core::AutocompleteField.new(option_tags: options) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   autocomplete_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class AutocompleteField < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      text_field_input_tag  + data_list_render
    end

    private

    def data_list_render
      content_tag :datalist, options[:option_tags], id: data_list_name
    end

    def text_field_input_tag
      if options[:builder].nil?
        text_field_tag content, html_options[:value], html_options
      else
        options[:builder].text_field content, html_options
      end
    end

    def component_html_options
      { autocomplete: true, list: data_list_name }
    end

    def component_html_classes
      'form-control'
    end

    def data_list_name
      @datalist ||= "#{ html_options[:id] || content }-datalist"
    end

    def state
      "form-control-#{ options[:state] }" if options[:state]
    end

    def component_html_options
      options[:status] == :disable ? { disabled: 'disabled' } : {}
    end

  end
end
