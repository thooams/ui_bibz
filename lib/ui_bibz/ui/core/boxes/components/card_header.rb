# frozen_string_literal: true

require 'ui_bibz/ui/core/boxes/components/card_tab_group'
module UiBibz::Ui::Core::Boxes::Components
  # Create a card header
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
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Boxes::CardHeader.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::CarHeader.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::CardHeader.new.render
  #
  #   UiBibz::Ui::Core::Boxes::CardHeader.new do
  #     'Exemple'
  #   end.render
  #
  #   UiBibz::Ui::Core::Boxes::CardHeader.new(tap: true) do |h|
  #     h.tab_group do |tg|
  #       tg.tab 'link', url: '#link"
  #       tg.tab 'link', url: '#link"
  #     end
  #   end.render
  #
  class CardHeader < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :div, glyph_and_content_html, html_options
    end

    def tab_group(content = nil, options = nil, html_options = nil, &block)
      @content = if tap?(content, options)
                   CardTabGroup.new(content, options, html_options).tap(&block).render
                 else
                   CardTabGroup.new(content, options, html_options, &block).render
                 end
    end

    private

    def component_html_classes
      ['card-header', outline]
    end

    def outline
      "text-#{@options[:status]} border-#{@options[:status]} bg-transparent" if @options[:outline]
    end
  end
end
