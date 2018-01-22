module UiBibz::Ui::Core::Navigations::Components

  # Create a BreadcrumbLink
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
  # * +state+ - status of élement with symbol value:
  #   (+:active+)
  # * +url+ - String
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::Breadcrumb::Components::BreadcrumbLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navigations::Breadcrumb::Components::BreadcrumbLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::Breadcrumb::Components::BreadcrumbLink.new('Home', { glyph: 'home', state: :active },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Navigations::Breadcrumb::Components::BreadcrumbLink.new({glyph: { name: 'eye', size: 3}, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class BreadcrumbLink < UiBibz::Ui::Core::Navigations::Link

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      content_tag :li, link_html, html_options
    end

  private

    def component_html_classes
      "breadcrumb-item"
    end

    def link_html
      if options[:url]
        link_to glyph_and_content_html, options[:url] || '#'
      else
        glyph_and_content_html
      end
    end

  end
end
