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
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+, +:link+)
  # * option_tags - Array, Object [required]
  # * searchable - Boolean
  # * max_options - Integer
  # * selected_text_format - String
  # * menu_size - Integer
  # * header - String
  # * actions_box - Boolean
  # * show_tick - Boolean
  # * show_menu_arrow - Boolean
  # * dropup - Boolean
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
  #   dropdown_select_field(content, options = {}, html_options = {})
  #
  class SelectField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      if options[:refresh]
        content_tag :div, class: 'input-group select-field-refresh' do
          concat select_tag content, options[:option_tags], html_options
          concat btn_refresh_html
        end
      else
        select_tag content, options[:option_tags], html_options
      end
    end

    private

    def component_html_classes
      ['select-field', 'form-control']
    end

    def btn_refresh_html
      content_tag :span, UiBibz::Ui::Core::Forms::Buttons::Button.new('', { glyph: 'refresh', status: options[:status], connect: connect_options }, { class: 'input-refresh-button' }).render, class: 'input-group-btn'

    end

    def connect_options
      connect = options[:refresh] || {}
      {
        events: connect.try(:[], :events) || "click",
        mode:   connect.try(:[], :type)   || "remote",
        target: {
          selector: connect.try(:[], :target).try(:[], :selector) || "##{ content.parameterize.underscore }",
          url:      connect.try(:[], :target).try(:[], :url)      || "",
          data:     connect.try(:[], :target).try(:[], :data)     || []
        }
      }
    end

  end
end
