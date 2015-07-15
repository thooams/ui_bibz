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
  #   UiBibz::Ui::Core::NavLink.new(content, { badge: 15, url: '/', status: :active },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::NavLink.new({glyph: { name: 'eye', size: 3 }, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class NavLink < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :li, content_htm, class_and_html_options.merge({ role: 'presentation' })
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
      lho = @options[:link_html_options] || {}
      if @options[:nav_type] == :tabs
        lho.merge({ "aria-controls" => @options[:selector], "role" => "tab", "data-toggle" => "tab" })
      else
        lho
      end
    end

  end
end
