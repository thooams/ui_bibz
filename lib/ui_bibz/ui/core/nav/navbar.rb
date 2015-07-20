require 'ui_bibz/ui/core/nav/components/navbar_nav'
require 'ui_bibz/ui/core/nav/components/navbar_text'
require 'ui_bibz/ui/core/nav/components/navbar_form'
module UiBibz::Ui::Core

  # Create a Navbar
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
  # * +type+ - Symbol (default: :default)
  #   (+:inverse+, +:default+)
  # * +glyph+
  # * +position+ - Symbol
  #   (+:top+, +:bottom+)
  # * +title+ - String
  #
  # ==== Signatures
  #
  #
  #   UiBibz::Ui::Core::Navbar.new(options = nil, html_options = nil).tap do |nb|
  #     ...
  #     nb.nav(options = nil, html_options = nil) do |n|
  #       n.link content options = nil, html_options = nil, &block
  #       n.link content options = nil, html_options = nil, &block
  #     end
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navbar.new().tap do |nb|
  #     nb.nav(position: :right) do |n|
  #       n.link 'Link 1', "#"
  #       n.link 'Link 2', "#"
  #     end
  #     nb.form(url: 'search/', type: :form_tag) do
  #       text_field_tag 'search', nil, { class: 'form-control', placeholder: 'Search' }
  #       button 'Submit', type: :submit
  #     end
  #     nb.text 'My text'
  #   end.render
  #
  # ==== Helper
  #
  #   navbar(options = { tap: true }, html_options = {}) do |nb|
  #     nb.nav(options = { tap: true }, html_options = {}) do |n|
  #       n.link(content, options = {}, html_options = {})
  #       n.link(options = {}, html_options = {}) do
  #         content
  #       end
  #     end
  #   end
  #
  class Navbar < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :nav, class_and_html_options(['navbar', type, position]) do
        content_tag :div, class: 'container-fluid' do
          concat header_html
          concat body_html
        end
      end
    end

    # Add navbar nav items
    # See UiBibz::Ui::Core::NavbarNav
    def nav content = nil, options = nil, html_options = nil, &block
      options = options || {}
      @items << UiBibz::Ui::Core::NavbarNav.new(content, options, html_options).tap(&block).render
    end

    # Add navbar form items
    # See UiBibz::Ui::Core::NavbarForm
    def form content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::NavbarForm.new(content, options, html_options, &block).render
    end

    # Add navbar text items
    # See UiBibz::Ui::Core::NavbarText
    def text content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::NavbarText.new(content, options, html_options, &block).render
    end

    def brand content = nil, options = nil, html_options = nil, &block
      @brand = UiBibz::Ui::Core::Component.new(content, options, html_options, &block)
    end

  private

    def header_html
      content_tag :div, class: 'navbar-header' do
        concat navbar_toggle_button_html
        concat link_to title.content, title.options[:url], title.class_and_html_options('navbar-brand')
      end
    end

    def title
      @title ||= @options[:title] ? brand(@options[:title], url: '/') : @brand
    end

    def body_html
      content_tag :div, @items.join.html_safe, class: "collapse navbar-collapse", id: id
    end

    def id
      @id ||= "navbar-collapse-#{ Random.new_seed }"
    end

    def navbar_toggle_button_html
      content_tag :button, class: 'navbar-toggle collapsed', data: { toggle: 'collapse', target:"##{ id }" } do
        concat content_tag :span, 'Toggle navigation', class: 'sr-only'
        concat content_tag :span, '', class: 'icon-bar'
        concat content_tag :span, '', class: 'icon-bar'
        concat content_tag :span, '', class: 'icon-bar'
      end
    end

    def position
      "navbar-fixed-#{ @options[:position] }" unless @options[:position].nil?
    end

    def type
      "navbar-#{ @options[:type] || 'default' }"
    end

  end
end
