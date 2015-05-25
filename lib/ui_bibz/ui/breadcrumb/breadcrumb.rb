require 'ui_bibz/ui/breadcrumb/components/breadcrumb_link'
module UiBibz::Ui

  # Create a breadcrumb
  #
  # This element is an extend of UiBibz::Ui::Component.
  # You can use tap method to add link items.
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Breadcrumb.new().tap do |b|
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  #   UiBibz::Ui::Alert.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Breadcrumb.new().tap do |b|
  #     b.link 'Home', url: '#home'
  #     b.link url: '#level-1' do
  #       'Level 1'
  #     end
  #     b.link 'Level 2', status: :active
  #   end.render
  #
  class Breadcrumb < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @links = []
    end

    def render
      content_tag :ol, @links.join.html_safe, class_and_html_options("breadcrumb")
    end

    # See UiBibz::Ui::BreadcrumbLink
    def link content = nil, options = nil, html_options = nil, &block
      @links << BreadcrumbLink.new(content, options, html_options, &block).render
    end

  end
end
