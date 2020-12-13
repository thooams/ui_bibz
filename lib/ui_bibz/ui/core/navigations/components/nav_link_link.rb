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
  # * +state+ - status of element with symbol value:
  #   (+:active+)
  #
  class NavLinkLink < UiBibz::Ui::Core::Component
    # UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :a, { href: options[:url] }.merge(html_options) do
        concat glyph_and_content_html
        concat tag_html if options[:tag]
      end
    end

    private

    def component_html_classes
      if options[:nav_type] == 'list-group'
        'list-group-item list-group-item-action'
      else
        'nav-link'
      end
    end

    def component_html_options
      html_tag_base = { 'data-bs-toggle' => 'tab', role: 'tab' }
      case options[:nav_type]
      when 'nav-tabs'
        html_tag_base
      when 'list-group'
        html_tag_base.merge("aria-controls": sanitize_text(content).parameterize)
      else
        {}
      end.merge(options[:a_html] || {})
    end
  end
end
