require 'ui_bibz/ui/breadcrumb/components/breadcrumb_link'
module UiBibz::Ui
  class Breadcrumb < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @links = []
    end

    def render
      content_tag :ol, @links.join('').html_safe, class_and_html_options("breadcrumb")
    end

    def link content = nil, options = nil, html_options = nil, &block
      @links << BreadcrumbLink.new(content, options, html_options, &block).render
    end

  end
end
