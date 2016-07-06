module UiBibz::Ui::Core::Buttons

  # Create a button
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
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+, +:link+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:outline)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Buttons::Button.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Buttons::Button.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Buttons::Button.new('test', type: :primary, size: :xs).render
  #
  #   UiBibz::Ui::Core::Buttons::Button.new(type: :primary) do
  #     test
  #   end.render
  #
  # ==== Helper
  #
  #  button(content, options = {}, html_options = {})
  #
  #  button(options = {}, html_options = {}) do
  #    content
  #  end
  class Button < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :button, glyph_and_content_html, html_options
    end

  protected

    def component_html_classes
      ['btn', size, type]
    end

    def component_html_options
      options[:toggle].nil? ? {} : { "data-toggle" => 'button', "aria-pressed" => false, "autocomplete" => "off" }
    end

    def status
      s = options[:status] || :primary
      "btn-#{ s }#{ outline }"
    end

    def outline
      "-outline" unless options[:outline].nil?
    end

    def toggle
    end

    def type
      "btn-block" if options[:type] == :block
    end

    # :lg, :sm or :xs
    def size
      "btn-#{ options[:size] }" if options[:size]
    end

  end
end
