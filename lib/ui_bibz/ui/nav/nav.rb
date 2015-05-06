require 'ui_bibz/ui/nav/components/nav_link'
module UiBibz::Ui

  # Create a nav
  #
  # This element is an extend of UiBibz::Ui::Component.
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Button.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Button.new(options = nil, html_options = nil).tap do |d|
  #     ...
  #     d. content = nil, options = nil, html_options = nil, block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Nav.new(type: :pills).tap do |d|
  #     d.link 'Test', url: '#test'
  #     d.link 'Test2', url: '#test2', status: :active
  #   end.render
  #
  class Nav < Component

    def initialize content = nil, options = nil, html_options = nil, &block
      super
      @links = []
    end

    def render
      content_tag :ul, @links.join().html_safe, class_and_html_options(["nav", "nav-#{ type }", position])
    end

    def link content = nil, options = {}, html_options = nil, &block
      @links << NavLink.new(content, options.merge({ nav_type: type }), html_options, &block).render
    end

  private

    # tabs or pills
    def type
      @options[:type] || :tabs
    end

    def position
      "nav-#{ @options[:position] }" unless @options[:position].nil?
    end

  end
end
