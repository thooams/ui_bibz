require 'ui_bibz/ui/core/forms/buttons/components/choice'
module UiBibz::Ui::Core::Forms::Buttons

  # Create a button choice
  #
  # This element is an extend of UiBibz::Ui::Core::Forms::Buttons::Button
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
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new('test', state: :active)
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonChoice.new({id: 'state', input_html_options: { class: 'state'}}, { class: 'lable-class'}) do
  #     test
  #   end.render
  #
  # ==== Helper
  #
  #   ui_button_choice(content, options = {}, html_options = {})
  #
  #   ui_button_choice(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class ButtonChoice < UiBibz::Ui::Core::Forms::Buttons::ButtonGroup

    # See UiBibz::Ui::Core::Forms::Buttons::Button.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def button content = nil, options = nil, html_options = nil, &block
      if block.nil?
        options = @options.merge(options || {})
      else
        content = @options.merge(content || {})
      end

      @items << Choice.new(content, options, html_options, &block).render
    end

    private

    def component_html_classes
      super << ['button-choice']
    end

    def component_html_options
      {}
    end

    def component_html_data
      super
      add_html_data "toggle", "buttons"
    end

  end
end
