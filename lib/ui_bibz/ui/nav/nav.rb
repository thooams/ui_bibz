require 'ui_bibz/ui/nav/components/link'
module UiBibz::Ui
  class Nav < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @links = []
    end

    def render
      content_tag :ul, @links.join().html_safe, class_and_html_options(["nav", "nav-#{ type }", position])
    end

    def link content = nil, options = nil, html_options = nil, &block
      @links << Link.new(content, options, html_options, &block).render
    end

  private

    # tabs or pills
    def type
      @options[:type] || 'tabs'
    end

    def position
      "nav-#{ @options[:position] }" unless @options[:position].nil?
    end

  end
end
