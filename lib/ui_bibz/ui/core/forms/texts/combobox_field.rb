# frozen_string_literal: true

require 'ui_bibz/ui/extensions/core/forms/surround_extension'
module UiBibz::Ui::Core::Forms::Texts
  # Create a ComboboxField
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
  # * +url+ - String [required]
  # * +append+  - String, Html
  # * +prepend+ - String, Html
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Texts::ComboboxField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Texts::ComboboxField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Texts::ComboboxField.new('company', { debounce: 200, url: 'http://exemple.com/list' }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Texts::ComboboxField.new(url: 'http://exemple.com/list') do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   combobox_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class ComboboxField < UiBibz::Ui::Core::Forms::Texts::TextField
    # See UiBibz::Ui::Core::Component.initialize

    private

    def text_field_input_tag
      content_tag :div, data: data_controller_attributes, class: 'combobox' do
        text_field_tag(content, options[:value] || html_options[:value], html_options) + combobox_list_render
      end
    end

    def combobox_list_render
      content_tag :div, class: 'combobox-list' do
        content_tag 'turbo-frame', '', id: combobox_list_name, src: ''
      end
    end

    def component_html_options
      { autocomplete: false, disabled: options[:state] }
    end

    def component_html_classes
      super << 'combobox-field'
    end

    def combobox_list_name
      @combobox_list_name ||= "#{html_options[:id] || content.to_s.parameterize.underscore}-combobox-list"
    end

    def component_html_data
      @data_html_options_builder.add('action', value: data_actions)
    end

    def data_controller_attributes
      {
        controller: data_controllers,
        'combobox-url-value': options[:url],
        'combobox-debounce-value': options[:debounce]
      }
    end

    def data_actions
      actions = [options[:action], html_options.dig(:data, :action)].compact
      actions.blank? ? 'keyup->combobox#search' : actions.join(' ')
    end

    def data_controllers
      controllers = [options.delete(:controller), html_options.try(:[], :data).try(:delete, :controller), @data_html_options_builder.html_options.try(:[], :data).try(:delete, :controller)].compact
      controllers.blank? ? 'combobox' : controllers.join(' ')
    end
  end
end
