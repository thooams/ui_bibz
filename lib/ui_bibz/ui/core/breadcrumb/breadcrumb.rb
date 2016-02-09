require 'ui_bibz/ui/core/breadcrumb/components/breadcrumb_link'
module UiBibz::Ui::Core

  # Breadcrumb
  #
  # Indicate the current page's location within a navigational hierarchy.
  # Separators are automatically added in CSS through +:before+ and +content+.
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
  # ==== Components
  #
  # +link+ is UiBibz::Ui::Core::BreadcrumbLink component
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
  # ==== Helper
  #
  #   breadcrumb({tap: true}) do |b|
  #     b.link(content, options = {}, html_options = {})
  #     b.link(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  #   breadcrumb({store: @users, link_label: name, link_url: user_path(:id)})
  #
  class Breadcrumb < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @links = []
    end

    # Render html tag
    def render
      generate_links unless store.nil?
      content_tag :ol, @links.join.html_safe, html_options
    end

    # Add breadcrumb link items
    # See UiBibz::Ui::Core::BreadcrumbLink
    def link content = nil, options = nil, html_options = nil, &block
      ap html_options
      @links << BreadcrumbLink.new(content, options, html_options, &block).render
    end

    private

    def component_html_classes
      'breadcrumb'
    end

    def store
      @options[:store]
    end

    def model_name
      store.class.to_s
    end

    def link_label
      @options[:link_label] || :name
    end

    def link_url
      @options[:link_url] || '#'
    end

    def generate_links
      @options[:store].each do |item|
        if item == @options[:store].last
          @links << BreadcrumbLink.new(item.send(link_label), state: :disabled).render
        else
          @links << BreadcrumbLink.new(item.send(link_label), url: inject_url(link_url, item)).render
        end
      end
    end

  end
end
