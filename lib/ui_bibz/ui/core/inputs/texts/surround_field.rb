module UiBibz::Ui::Core::Inputs::Texts

  # Create a SurroundField
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
  # * +prepend+ - String
  # * +append+ - String
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Inputs::Texts::SurroundField.new(content, options = {}, html_options = {}).render
  #
  #   UiBibz::Ui::Core::Inputs::Texts::SurroundField.new(options = {}, html_options = {}) do
  #     content
  #   end.render
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Inputs::Texts::SurroundField.new('search', prepend: 'Prepend content', append: 'Append content', class: 'test')
  #
  #   UiBibz::Ui::Core::Inputs::Texts::SurroundField.new(prepend: glyph('pencil'), append: glyph('camera-retro')) do
  #     #content
  #   end
  #
  # ==== Helper
  #
  #   surround_field(options = {}, html_options = {}) do
  #    # content
  #   end
  #
  class SurroundField < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      if options[:append].nil? && options[:prepend].nil?
        text_field_input_tag
      else
        content_tag :div, class: join_classes('input-group', size, status) do
          concat content_tag :span, options[:append], class: 'input-group-addon' unless options[:append].nil?
          concat text_field_input_tag
          concat content_tag :span, options[:prepend], class: 'input-group-addon' unless options[:prepend].nil?
        end
      end
    end

    private

    # Simple_form or not
    def text_field_input_tag
      if options[:builder].nil?
        text_field_tag content, html_options[:value], html_options
      else
        options[:builder].text_field content, html_options
      end
    end

    def component_html_classes
      'form-control'
    end

    # :lg, :sm or :xs
    def size
      "input-group-#{ options[:size] }" if options[:size]
    end

    def status
      "has-#{ options[:status] }" if options[:status]
    end

    def component_html_options
      options[:state] == :disabled ? { disabled: 'disabled' } : {}
    end

  end
end
