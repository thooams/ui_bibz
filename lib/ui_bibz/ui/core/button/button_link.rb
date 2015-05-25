module UiBibz::Ui::Core

  # Create a button link
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
  # * +state+ - State of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +url+ - String url
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::ButtonLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::ButtonLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ButtonLink.new('test', type: :primary, url: '#')
  #
  #   UiBibz::Ui::Core::ButtonLink.new(type: :primary, url: '#') do
  #     test
  #   end.render
  #
  class ButtonLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      link_to glyph_and_content_html, @options[:url], class_and_html_options("btn")
    end

  private

    def state
      sym = @options[:state] || :default
      "btn-#{  states[sym] }"
    end

    # :lg, :sm or :xs
    def size
      "btn-#{ @options[:size] }" if @options[:size]
    end

  end
end
