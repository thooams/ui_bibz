# frozen_string_literal: true

require 'ui_bibz/ui/core/navigations/components/nav_link'
require 'ui_bibz/ui/core/navigations/components/nav_text'
require 'ui_bibz/ui/core/navigations/components/nav_dropdown'
module UiBibz::Ui::Core::Navigations
  # Create a nav
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
  # * +type+ - Symbol
  #   (+:pills+, +:tab+)
  # * +position+ - Symbol
  #   (+:left+, +:right+, +:center+)
  # * +stacked+ - Boolean
  # * +tag+ - Symbol
  #   (+:a+, +:li)
  # * +justify+ - Boolean
  # * +fill+ - Boolean
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::Nav.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navigations::Nav.new(options = nil, html_options = nil).tap do |n|
  #     ...
  #     n.link content = nil, options = nil, html_options = nil, block
  #     n.link content = nil, options = nil, html_options = nil, block
  #     n.dropdown content = nil, options = nil, html_options = nil, block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::Nav.new(type: :pills).tap do |n|
  #     n.link 'Test', url: '#test'
  #     n.link 'Test2', url: '#test2', state: :active
  #     n.dropdown('Action') do |d|
  #       d.list content = nil, options = nil, html_options = nil, &block
  #     end
  #   end.render
  #
  # ==== Helper
  #
  #   nav(options = { tap: true }, html_options = {}) do |n|
  #     n.link(content, options = {}, html_options = {})
  #     n.link(options = {}, html_options = {}) do
  #       content
  #     end
  #     n.dropdown(name, options = {}, html_options = {}) do |d|
  #       d.list(content, options = {}, html_options = {})
  #       d.list(options = {}, html_options = {}) do
  #         content
  #       end
  #     end
  #   end
  #
  class Nav < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @items = []
    end

    # Render html tag
    def pre_render
      content_tag htlm_tag, @items.map(&:render).join.html_safe, html_options
    end

    # Add nav link items
    # See UiBibz::Ui::Core::Navigations::NavLink
    def link(content = nil, options = {}, html_options = nil, &block)
      block_given? ? content.merge!({ nav_type: type, nav_tags: nav_tags }) : options.merge!({ nav_type: type, nav_tags: nav_tags })
      @items << NavLink.new(content, options, html_options, &block)
    end

    def text(content = nil, options = {}, html_options = nil, &block)
      block_given? ? content.merge!({ nav_type: type }) : options.merge!({ nav_type: type })
      @items << NavText.new(content, options, html_options, &block)
    end

    # Add nav in nav
    def nav(content = nil, options = {}, html_options = nil, &block)
      @items << UiBibz::Ui::Core::Component.new(Nav.new(content, options).tap(&block).render, {}, html_options)
    end

    # Add nav dropdown items
    # See UiBibz::Ui::Core::Navigations::NavDropdown
    def dropdown(content = nil, options = {}, html_options = nil, &block)
      @items << NavDropdown.new(content, options, html_options).tap(&block)
    end

    def spacer(num = 'auto')
      kls = " mr-#{num}"
      @items.last.html_options[:class].nil? ? @items.last.html_options[:class] = kls : @items.last.html_options[:class] << kls
    end

    protected

    def component_html_classes
      [nav_class, type, position, stacked, justify, fill]
    end

    def component_html_options
      @options[:type] == :list ? { role: 'tablist' } : super
    end

    # tabs or pills
    def type
      if @options[:type] == :list
        'list-group'
      else
        "nav-#{@options[:type]}" unless @options[:type].nil?
      end
    end

    def position
      case @options[:position]
      when :center
        'justify-content-center'
      when :right
        'justify-content-end'
      end
    end

    def justify
      return unless @options[:justify]

      type == 'nav-links' ? 'nav-justified' : 'nav-fill'
    end

    def fill
      'nav-fill' if @options[:fill]
    end

    def stacked
      'flex-column' if @options[:stacked]
    end

    def htlm_tag
      options[:tag] || tag_type
    end

    def nav_class
      'nav' if type != 'list-group'
    end

    def tag_type
      case type
      when 'nav-links'
        :nav
      when 'list-group'
        :div
      else
        :ul
      end
    end

    def nav_tags
      @options[:nav_tags]
    end
  end
end
