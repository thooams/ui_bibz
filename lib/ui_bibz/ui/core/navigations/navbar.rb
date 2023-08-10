# frozen_string_literal: true

require 'ui_bibz/ui/core/navigations/components/navbar_nav'
require 'ui_bibz/ui/core/navigations/components/navbar_text'
require 'ui_bibz/ui/core/navigations/components/navbar_form'
require 'ui_bibz/ui/core/navigations/components/navbar_brand'
module UiBibz::Ui::Core::Navigations
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
  # * +position_type+ - Symbol
  #   (+:fixed+, +:sticky+)
  # * +title+ - String
  # * +container+ - Hash container options
  # * +container_html+ - Hash container html options
  # * +expand_size+ - Symbol size
  # (+:sm+, +:md+, +:lg+, +:xl+, +:xxl+)
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
  #   ui_navbar(options = {}, html_options = {}) do |nb|
  #     nb.nav(options = {}, html_options = {}) do |n|
  #       n.link(content, options = {}, html_options = {})
  #       n.link(options = {}, html_options = {}) do
  #         content
  #       end
  #     end
  #     nb.brand content
  #     nb.link 'toto', "#"
  #   end
  #
  class Navbar < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern
    include UiBibz::Ui::Concerns::NavigationConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(...)
      super
      @items = []
    end

    # Render html tag
    def pre_render
      content_tag :nav, html_options do
        UiBibz::Ui::Core::Layouts::Container.new(options[:container], options[:container_html]) do
          if brand_position == :left
            concat title
            concat @navbar_toggle_html
          end
          concat navbar_toggle_button_html
          if brand_position == :right
            concat title
            concat @navbar_toggle_html
          end
          concat body_html
        end.render
      end
    end

    # Add navbar nav items
    # See UiBibz::Ui::Core::NavbarNav
    def nav(content = nil, options = nil, html_options = nil, &block)
      options ||= {}
      @items << UiBibz::Ui::Core::Navigations::NavbarNav.new(content, options, html_options).tap(&block)
    end

    # Add navbar form items
    # See UiBibz::Ui::Core::NavbarForm
    def form(model_or_url, options = {}, &block)
      @items << UiBibz::Ui::Core::Navigations::NavbarForm.new(model_or_url, options, &block)
    end

    # Not use !!!!!
    # Add navbar text items
    # See UiBibz::Ui::Core::NavbarText
    def text(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Core::Navigations::NavbarText.new(content, options, html_options, &block)
    end

    def brand(content = nil, options = nil, html_options = nil, &block)
      @brand = UiBibz::Ui::Core::Navigations::NavbarBrand.new(content, options, html_options, &block).render
    end

    def id
      @id ||= generate_id('navbar-id')
    end

    def navbar_toggle_html(content = nil, &block)
      @navbar_toggle_html = if block.nil?
                              content
                            else
                              context = eval('self', block.binding) # rubocop:disable Style/EvalWithLocation
                              context.capture(&block)
                            end
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
      content_tag(:div, class: 'navbar-collapse collapse', id:) do
        concat @items.map(&:render).join.html_safe
      end
    end

    def navbar_toggle_button_html
      content_tag :button, '☰', class: 'navbar-toggler hidden-sm-up', type: :button, data: { 'bs-toggle': 'collapse', 'bs-target': "##{id}" }
    end

    def expand_size
      "navbar-expand-#{@options[:expand_size] || :lg}" unless options[:collapsible] == false
    end

    def position
      "#{position_type}-#{@options[:position]}" unless @options[:position].nil?
    end

    def brand_position
      @options[:brand_position] || :left
    end

    # fixed || sticky
    def position_type
      @options[:position_type] || 'fixed'
    end

    def type
      "navbar-#{@options[:type] || 'light'}"
    end

    def status
      "bg-#{@options[:status]}" unless @options[:status].nil?
    end
  end
end
