module UiBibz::Ui::Core::Inputs::Buttons

  # Create a button choice
  #
  # This element is an extend of UiBibz::Ui::Core::Inputs::Buttons::Button
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
  # * +type+ - Symbol (+:checkbox+, +:radio+)
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +url+ - String url
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:block)
  # * +name+ - String name of input checkbox
  # * +id+ - String id of input checkbox
  # * +input_html_options+ - Hash of input html options
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Inputs::Buttons::ButtonChoice.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Inputs::Buttons::ButtonChoice.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Inputs::Buttons::ButtonChoice.new('test', state: :active)
  #
  #   UiBibz::Ui::Core::Inputs::Buttons::ButtonChoice.new({id: 'state', input_html_options: { class: 'state'}}, { class: 'lable-class'}) do
  #     test
  #   end.render
  #
  # ==== Helper
  #
  #   button_choice(content, options = {}, html_options = {})
  #
  #   button_choice(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class ButtonChoice < UiBibz::Ui::Core::Inputs::Buttons::Button

    # See UiBibz::Ui::Core::Inputs::Buttons::Button.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :label, html_options do
        concat tag(:input,input_options)
        concat @content
      end
    end

    private

    def component_html_classes
      ['btn', size]
    end

    def input_options
      { type: type, autocomplete: :off }.merge(checked).merge(name).merge(id).merge(input_html_options)
    end

    def checked
      @options[:state] == :active ? { checked: :checked } : {}
    end

    def name
      @options[:name].nil? ? {} : { name: @options[:name] }
    end

    def id
      @options[:id].nil? ? {} : { id: @options[:id] }
    end

    def input_html_options
      @options[:input_html_options].nil? ? {} : @options[:input_html_options]
    end

    def type
      @options[:type] || :checkbox
    end

  end
end
