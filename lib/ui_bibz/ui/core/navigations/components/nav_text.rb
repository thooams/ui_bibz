# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations

  # Create a NavLinkLink
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
  #
  class NavText < UiBibz::Ui::Core::Component

    # UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def pre_render
      options[:nav_type] == "nav-links" ? content_html : content_tag(:li, content_html, class: 'nav-item nav-text')
    end

  private

    def content_html
      content_tag :span, html_options do
        concat glyph_and_content_html
        concat tag_html if options[:tag]
      end
    end

    def component_html_classes
      "nav-link"
    end

    def component_html_options
      options[:nav_type] == "nav-tabs" ? { "data-toggle" => "tab", role: 'tab' } : {}
    end

  end
end
