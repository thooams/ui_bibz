# frozen_string_literal: true

require 'ui_bibz/ui/extensions/core/forms/surround_extension'
module UiBibz::Ui::Core::Forms::Texts
  # Create a AutoCompleteField
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
  # * +append+  - String, Html
  # * +prepend+ - String, Html
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   options = options_for_select(2.times.map{ |i| "option #{i}" })
  #   UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new('company', { option_tags: options }, { class: 'test' })
  #
  #   options = options_for_select(2.times.map{ |i| "option #{i}" })
  #   UiBibz::Ui::Core::Forms::Texts::AutoCompleteField.new(option_tags: options) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   auto_complete_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class AutoCompleteField < UiBibz::Ui::Core::Forms::Texts::TextField
    # See UiBibz::Ui::Core::Component.initialize

    private

    def text_field_input_tag
      text_field_tag(content, options[:value] || html_options[:value], html_options) + data_list_render
    end

    def data_list_render
      content_tag :datalist, options[:option_tags], id: data_list_name
    end

    def component_html_options
      { autocomplete: true, list: data_list_name, disabled: options[:state] }
    end

    def component_html_classes
      super << 'auto-complete-field'
    end

    def data_list_name
      @data_list_name ||= "#{html_options[:id] || content.to_s.parameterize.underscore}-datalist"
    end

    # Connect option
    def connect_options_selector
      data_list_name
    end
  end
end
