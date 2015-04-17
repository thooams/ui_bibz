require 'ui_bibz/ui/breadcrumb/components/breadcrumb_link'
module UiBibz::Ui
  class Breadcrumb < Component

    # Create a breadcrumb
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Breadcrumb.new().tap do |b|
    #     b.link 'Home', url: '#home'
    #     b.link 'Level 1', url: '#level-1'
    #     b.link 'Level 2', status: :active
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @links = []
    end

    def render
      content_tag :ol, @links.join.html_safe, class_and_html_options("breadcrumb")
    end

    def link content = nil, options = nil, html_options = nil, &block
      @links << BreadcrumbLink.new(content, options, html_options, &block).render
    end

  end
end
