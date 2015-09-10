module UiBibz::Ui::Core

  # Create a button choice
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
  # * +type+ - Symbol (+:checkbox+, +:radio+)
  # * +state+ - State of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +url+ - String url
  # * +outline+ - Boolean
  # * +status+ - Symbol (+:active+, +:disabled)
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
  #   UiBibz::Ui::Core::ButtonChoice.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::ButtonChoice.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ButtonChoice.new('test', status: :active)
  #
  #   UiBibz::Ui::Core::ButtonChoice.new({id: 'toto', input_html_options: { class: 'toto'}}, { class: 'lable-class'}) do
  #     test
  #   end.render
  #
  # ==== Helper
  #
  #   button_checkbox(content, options = {}, html_options = {})
  #
  #   button_checkbox(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class ButtonChoice < UiBibz::Ui::Core::Button

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :label, class_and_html_options(['btn', size]) do
        concat tag(:input, { type: type, autocomplete: :off }.merge(checked).merge(name).merge(id).merge(input_html_options))
        concat @content
      end
    end

    private

    def checked
      @options[:status] == :active ? { checked: :checked } : {}
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
