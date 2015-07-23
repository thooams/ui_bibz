module UiBibz::Ui::Core

  # Create DropdownLink
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
  # * +status+ - State of élement with symbol value:
  #   (+:active+)
  # * +url+ - String
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  # * +link_html_options+ - Hash
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::DropdownLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::DropdownLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::DropdownLink.new('Home', { glyph: 'home', status: :active, url: '#home', link_html_options: { class: 'link1' }},{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::DropdownLink.new({ glyph: { name: 'eye', size: 3 }, url: '#home' }, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class DropdownLink < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :li, @html_options.merge({ role: 'presentation' }) do
        link_to glyph_and_content_html, @options[:url], @options[:link_html_options]
      end
    end

  end
end
