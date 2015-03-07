module UiBibz::Ui
  class Nav < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @nav = Component.new content, options, html_options, &block
    end

    def render
      content_tag :ul, @nav.render, { class: @nav.cls("nav #{ type }") }
    end

    def type
      @nav.options[:type] || 'nav-tabs'
    end

  end
end
