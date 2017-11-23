module UiBibz::Ui::Core::Forms::Choices

  # Create a choice
  #
  # This element is an extend of UiBibz::Ui::Core::Forms::Choices::Button
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
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
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
  #   UiBibz::Ui::Core::Forms::Choices::Choice.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Choices::Choice.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Choices::Choice.new('test', state: :active)
  #
  #   UiBibz::Ui::Core::Forms::Choices::Choice.new({id: 'state', input_html_options: { class: 'state'}}, { class: 'lable-class'}) do
  #     test
  #   end.render
  #
  # ==== Helper
  #
  #   choice(content, options = {}, html_options = {})
  #
  #   choice(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class Choice < UiBibz::Ui::Core::Forms::Buttons::Button

    # See UiBibz::Ui::Core::Forms::Choices::Button.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      button_choice_html_tag
    end

    private

    def button_choice_html_tag
      content_tag :label, html_options do
        concat tag(:input, input_options)
        concat glyph_and_content_html(options[:text].nil? ? @content : ' ')
        concat badge_html unless options[:badge].nil?
      end
    end

    def input_options
      { type: type, autocomplete: :off }.merge(checked).merge(value).merge(name).merge(id).merge(input_html_options)
    end

    def checked
      @options[:state] == :active ? { checked: :checked } : {}
    end

    def value
      @options[:value].nil? ? {} : { value: options[:value] }
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

    def status
      ["btn", outline, options[:status] || :secondary].compact.join('-')
    end

  end
end
