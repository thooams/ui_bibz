# frozen_string_literal: true

require 'ui_bibz/ui/core/navigations/components/breadcrumb_link'
module UiBibz::Ui::Core::Navigations
  # Breadcrumb
  #
  # Indicate the current page's location within a navigational hierarchy.
  # Separators are automatically added in CSS through +:before+ and +content+.
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
  # * +link_label+ - [Symbol | String] Display label of link with store
  # * +link_url+   - [String] Display url of link with store
  #
  # ==== Components
  #
  # +link+ is UiBibz::Ui::Core::Navigations::BreadCrumb::Components::BreadcrumbLink component
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::Breadcrumb.new().tap do |b|
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     b.link content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  #   UiBibz::Ui::Core::Navigations::Breadcrumb.new(@store)
  #
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::Breadcrumb.new().tap do |b|
  #     b.link 'Home', url: '#home'
  #     b.link url: '#level-1' do
  #       'Level 1'
  #     end
  #     b.link 'Level 2', state: :active
  #   end.render
  #
  #   # or
  #
  #   @users = User.all
  #   UiBibz::Ui::Core::Navigations::Breadcrumb.new(@users).render
  #
  # ==== Helper
  #
  #   ui_breadcrumb do |b|
  #     b.link(content, options = {}, html_options = {})
  #     b.link(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  #   # or
  #
  #   @users = User.all
  #   ui_breadcrumb(@users, { link_label: name, link_url: user_path(:id) })
  #
  class Breadcrumb < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(...)
      super
      @links = []
      generate_links unless @content.nil?
    end

    # Render html tag
    def pre_render
      content_tag :nav, html_options do
        content_tag :ol, @links.join.html_safe, class: 'breadcrumb'
      end
    end

    # Add breadcrumb link items
    # See UiBibz::Ui::Core::BreadcrumbLink
    def link(content = nil, options = nil, html_options = nil, &)
      @links << UiBibz::Ui::Core::Navigations::Components::BreadcrumbLink.new(content, options, html_options, &).render
    end

    private

    def component_html_options
      html_opts = super.merge({ 'arial-label': 'breadcrumb' })
      html_opts = html_opts.merge(style: "--bs-breadcrumb-divider: '#{@options[:divider]}';") unless @options[:divider].nil?
      html_opts
    end

    def model_name
      content.class.to_s
    end

    def link_label
      @options[:link_label] || :name
    end

    def link_url
      @options[:link_url] || '#'
    end

    def generate_links
      content.each do |item|
        @links << UiBibz::Ui::Core::Navigations::Components::BreadcrumbLink.new(item.send(link_label), url: inject_url(link_url, item), current: item == last_item).render
      end
    end

    def last_item
      content.last
    end
  end
end
