module UiBibz::Ui::Core::Forms::Numbers

  # Create a FormulaField
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
  # *  - formula_field_name, String || Symbol (default: "#{content}_formula")
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new('value', { formula_field_name: :formula }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::Forms::Numbers::FormulaField.new do
  #     'value'
  #   end
  #
  # ==== Helper
  #
  #   formula_field(value, options = {}, html_options = {})
  #
  class FormulaField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, class: join_classes('input-group', 'formula_field', status) do
        concat text_field_formula_input_tag
        concat formula_field_sign
        concat text_field_input_tag
        concat formula_field_alert
      end
    end

    private

    def text_field_input_tag
      text_field_tag content, html_options.delete(:value), readonly: true, class: 'formula-field-result form-control'
    end

    def text_field_formula_input_tag
      text_field_tag formula_field_name, html_options.delete(:formula_field_value), html_options.except(:value)
    end

    def component_html_classes
      'formula-field form-control'
    end

    def component_html_options
      options[:state] == :disabled ? { disabled: 'disabled' } : {}
    end

    def formula_field_alert
      content_tag :span, class: 'formula-field-alert input-group-addon', data: { toggle: 'tooltip' } do
        UiBibz::Ui::Core::Glyph.new('exclamation-triangle', status: :danger ).render
      end
    end

    def formula_field_name
      options[:formula_field_name] || content_formula_name
    end

    def content_formula_name
      content.to_s.split('').select{ |i| i == "]" }.count > 0 ? content.to_s.gsub(/]$/, "_formula]") : "#{ content }_formula"
    end

    def formula_field_sign
      content_tag :span, '=', class: 'formula-field-sign input-group-addon'
    end

    def status
      "has-#{ options[:status] }" if options[:status]
    end

  end
end
