require 'ui_bibz/ui/core/navs/components/navbar_nav'
require 'ui_bibz/ui/core/navs/components/navbar_text'
require 'ui_bibz/ui/core/navs/components/navbar_form'
require 'ui_bibz/ui/core/navs/components/navbar_brand'
module UiBibz::Ui::Core::Navs

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
  # * +type+ - Symbol
  #   (+:light+, +:dark+)
  # * +glyph+
  # * +status+
  #   (+:secondary+, +:primary+, +:info+, +:warning+, +:danger+, +inverse+)
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
  class Navbar < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @items = []
    end

    # Render html tag
    def render
      content_tag :nav, html_options do
        concat title if brand_position == :left
        concat navbar_toggle_button_html
        concat title if brand_position == :right
        concat body_html
      end
    end

    # Add navbar nav items
    # See UiBibz::Ui::Core::NavbarNav
    def nav content = nil, options = nil, html_options = nil, &block
      options = options || {}
      @items << UiBibz::Ui::Core::Navs::NavbarNav.new(content, options, html_options).tap(&block).render
    end

    # Add navbar form items
    # See UiBibz::Ui::Core::NavbarForm
    def form model_or_url, options = {}, &block
      @items << UiBibz::Ui::Core::Navs::NavbarForm.new(model_or_url, options, &block).render
    end

    # Not use !!!!!
    # Add navbar text items
    # See UiBibz::Ui::Core::NavbarText
    def text content = nil, options = nil, html_options = nil, &block
      @items << UiBibz::Ui::Core::Navs::NavbarText.new(content, options, html_options, &block).render
    end

    def brand content = nil, options = nil, html_options = nil, &block
      @brand = UiBibz::Ui::Core::Navs::NavbarBrand.new(content, options, html_options, &block).render
    end

    def id
      @id ||= "navbar-id-#{ Random.new_seed }"
    end

  private

    def component_html_classes
      ['navbar', type, position, expand_size]
    end

    def title
      @title ||= if @brand.nil?
         brand(@options[:title]) unless @options[:title].nil?
      else
        @brand
      end
    end

    def body_html
      content_tag :div, class: "collapse navbar-collapse", id: id do
        concat @items.join.html_safe
      end
    end

    def navbar_toggle_button_html
      content_tag :button, "☰", class: 'navbar-toggler hidden-sm-up', type: :button, data: { toggle: 'collapse', target:"##{ id }" }
    end

    def expand_size
      "navbar-expand-#{ @options[:expand_size] || :lg }" #unless @options[:expand_size].nil?
    end

    def position
      "fixed-#{ @options[:position] }" unless @options[:position].nil?
    end

    def brand_position
      @options[:brand_position] || :left
    end

    def type
      "navbar-#{ @options[:type] || 'light' }"
    end

    def status
      "bg-#{ @options[:status] }" unless @options[:status].nil?
    end

  end
end
