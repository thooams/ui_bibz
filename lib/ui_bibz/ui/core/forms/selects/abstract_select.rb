# frozen_string_literal: true

require 'ui_bibz/ui/extensions/core/forms/surround_extension'
module UiBibz::Ui::Core::Forms::Selects
  # Create a SelectField
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
  # source : http://silviomoreto.github.io/bootstrap-select/examples/
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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+, +:link+)
  # * +option_tags+ - Array, Object [required]
  # * +searchable+ - Boolean
  # * +max_options+ - Integer
  # * +selected_text_format+ - String
  # * +menu_size+ - Integer
  # * +header+ - String
  # * +actions_box+ - Boolean
  # * +show_tick+ - Boolean
  # * +show_menu_arrow+ - Boolean
  # * +dropup+ - Boolean
  # * +append+ - String, Html
  # * +prepend+ - String, Html
  # * +connect+ - Hash
  #   * +event+ - String
  #   * +mode+ - String
  #   * +target+ - Hash
  #     * +selector+ - String
  #     * +data+ - Array
  #     * +url+ - String
  # * +refresh+ - Hash
  #   * +event+ - String
  #   * +mode+ - String
  #   * +target+ - Hash
  #     * +selector+ - String
  #     * +data+ - Array
  #     * +url+ - String
  #
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new('fruits', { option_tags: list_of_fruits, searchable: true }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Selects::SelectField.new({ option_tags: list_of_fruits, actions_box: true }, { class: 'test' }) do
  #     'fruits'
  #   end
  #
  # ==== Helper
  #
  #   select_field(content, options = {}, html_options = {})
  #
  class AbstractSelect < UiBibz::Ui::Core::Component
    include SurroundExtension

    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      surround_field select_field_html_tag
    end

    private

    def select_field_html_tag
      select_tag content, options[:option_tags], html_options
    end

    # Try to put it on a line
    def component_html_options
      super.merge({
                    multiple: options[:multiple],
                    disabled: options[:state] == :disabled,
                    include_blank: options[:include_blank],
                    prompt: options[:prompt]
                  })
    end
  end
end
