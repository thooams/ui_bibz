module UiBibz::Ui::Core

  # Create a NavLink
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
  # * +status+ - State of élement with symbol value:
  #   (+:active+)
  # * +url+ - String
  # * +badge+ - String
  # * +link_html_options+ - Hash
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::NavLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::NavLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::NavLink.new(content, { badge: 15, url: '/', status: :active, link_html_options: { class: 'link1' }},{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::NavLink.new({glyph: { name: 'eye', size: 3 }, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class NavLink < Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      if @options[:nav_type] == "nav-links"
        content_htm
      else
        content_tag :li, content_htm, class_and_html_options('nav-item')
      end
    end

  private

    # content_htm and not content_html for haml bug
    def content_htm
      link_to @options[:url], link_html_options do
        concat glyph_and_content_html
        concat badge_html if @options[:badge]
      end
    end

    def link_html_options
      if @options[:nav_type] == "nav-tabs"
        lho.merge({ "data-toggle" => "tab", role: 'tab', class: link_class })
      else
        lho.merge({class: link_class})
      end
    end

    def lho
      @options[:link_html_options] || {}
    end

    def link_class
      [@options.delete(:status), lho[:class], "nav-link"].compact.join(' ')
    end

  end
end
