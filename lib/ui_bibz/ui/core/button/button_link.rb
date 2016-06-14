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
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +url+ - String url
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:block)
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
  # ==== Helper
  #
  #   button_link(content, options = {}, html_options = {})
  #
  #   button_link(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class ButtonLink < UiBibz::Ui::Core::Button

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      link_to glyph_and_content_html, options[:url], html_options
    end

  private

    def component_html_classes
      ['btn', size, type]
    end

  end
end
