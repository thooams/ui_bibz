# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations
  # Create a NavLinkList
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
  class NavLinkList < UiBibz::Ui::Core::Component
    # Render html tag
    def pre_render
      content_tag :li, content, html_options
    end

    private

    def component_html_classes
      'nav-item'
    end
  end
end
