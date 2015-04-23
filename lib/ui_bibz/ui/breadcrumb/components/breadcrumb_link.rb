module UiBibz::Ui

  # Create a BreadcrumbLink
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::BreadcrumbLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::BreadcrumbLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::BreadcrumbLink.new('Home', { glyph: 'home', status: :active },{ class: 'test' })
  #
  #   UiBibz::Ui::BreadcrumbLink.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class BreadcrumbLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :li, link_html, class_and_html_options
    end

  private

    def link_html
      if @options[:url]
        link_to glyph_and_content_html, @options[:url], @options[:link_html_options]
      else
        glyph_and_content_html
      end
    end

  end
end
