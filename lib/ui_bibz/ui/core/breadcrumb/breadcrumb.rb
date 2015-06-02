require 'ui_bibz/ui/core/breadcrumb/components/breadcrumb_link'
module UiBibz::Ui::Core

  # Create a breadcrumb
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
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
  #   UiBibz::Ui::Core::Breadcrumb.new().tap do |b|
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  #   UiBibz::Ui::Core::Alert.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Breadcrumb.new().tap do |b|
  #     b.link 'Home', url: '#home'
  #     b.link url: '#level-1' do
  #       'Level 1'
  #     end
  #     b.link 'Level 2', status: :active
  #   end.render
  #
  # <%= breadcrumb do |b| %>
  #   <%- d.link 'Home', url: '#home' %>
  # <%= end %>
  #
  class Breadcrumb < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @links = []
    end

    def render
      content_tag :ol, @links.join.html_safe, class_and_html_options("breadcrumb")
    end

    # See UiBibz::Ui::Core::BreadcrumbLink
    def link content = nil, options = nil, html_options = nil, &block
      @links << BreadcrumbLink.new(content, options, html_options, &block).render
    end

  end
end
