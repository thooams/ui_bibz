module UiBibz::Ui::Core

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
  class NavLinkList < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :li, content, html_options
    end

  private

    def component_html_classes
      'nav-item'
    end

  end
end
