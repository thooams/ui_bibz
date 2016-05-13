module UiBibz::Ui::Core

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
  #   UiBibz::Ui::Core::FormulaField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::FormulaField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::FormulaField.new('value', { formula_field_name: :formula }, { class: 'test' })
  #
  #   UiBibz::Ui::Core::FormulaField.new do
  #     'value'
  #   end
  #
  # ==== Helper
  #
  #   formula_field(value, options = {}, html_options = {})
  #
  class FormulaField < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, class: 'input-group formula_field' do
        concat text_field_input_tag
        concat formula_field_sign
        concat text_field_formula_input_tag
        concat formula_field_alert
      end
    end

    private

    def text_field_input_tag
      if options[:builder].nil?
        text_field_tag content, html_options[:value], html_options
      else
        options[:builder].text_field content, html_options
      end
    end

    def text_field_formula_input_tag
      if options[:builder].nil?
        text_field_tag formula_field_name, '', readonly: true, class: 'formula_field_result form-control'
      else
        options[:builder].text_field formula_field_name, readonly: true, class: 'formula_field_result form-control'
      end
    end

    def component_html_classes
      'formula_field_input form-control'
    end

    def formula_field_alert
      content_tag :span, class: 'formula_field_alert input-group-addon', data: { toggle: 'tooltip' } do
        UiBibz::Ui::Core::Glyph.new('exclamation-triangle', state: :danger ).render
      end
    end

    def formula_field_name
      "#{ content }_formula" || options[:formula_field_name]
    end

    def formula_field_sign
      content_tag :span, '=', class: 'formula_field_sign input-group-addon'
    end

  end
end
