# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations
  # Create a Link
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
  # * +state+ - status of element with symbol value:
  #   (+:active+)
  # * +url+ - String
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::Link.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navigations::Link.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::Link.new('Home', { glyph: 'home', url: '#url', state: :active },{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Navigations::Link.new({ url: '#url', glyph: { name: 'eye', size: 3}}, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class Link < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      link_to glyph_and_content_html, options[:url] || "##{options[:collapse]}", html_options
    end

    private

    def component_html_options
      opts = super
      opts = opts.merge(collapse) unless options[:collapse].nil?
      opts
    end

    def collapse
      {
        role: 'button',
        data: { 'bs-toggle': :collapse },
        aria: {
          controls: options[:collapse],
          expanded: options[:active_collapse].nil? ? false : options[:active_collapse]
        }
      }
    end

    def text
      @options[:text].nil? || @options[:text]
    end
  end
end
