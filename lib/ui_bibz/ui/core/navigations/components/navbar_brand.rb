# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations
  # Create a Navbar
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
  class NavbarBrand < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
    end

    # Render html tag
    def pre_render
      if options[:url]
        link_to content, brand_url, html_options
      else
        content_tag :span, content, html_options
      end
    end

    private

    def component_html_classes
      'navbar-brand'
    end

    def brand_url
      options[:url] || '/'
    end
  end
end
