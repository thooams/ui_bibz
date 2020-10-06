# frozen_string_literal: true

require 'ui_bibz/ui/core/boxes/components/card_header'
require 'ui_bibz/ui/core/boxes/components/card_footer'
require 'ui_bibz/ui/core/boxes/components/card_body'
require 'ui_bibz/ui/core/boxes/components/card_image'
require 'ui_bibz/ui/core/boxes/components/card_list_group'
require 'ui_bibz/ui/core/boxes/concerns/card_itemable_concern'
require 'ui_bibz/ui/core/boxes/components/card_row'
module UiBibz::Ui::Core::Boxes
  # Create a card
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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * text - Hash (+:size+, +:position+)
  #   (+:left+, +:right+, +:center+)
  # * block - Boolean
  # * type - Symbol
  #   (+:inverse+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Boxes::Card.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Boxes::Card.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  #   UiBibz::Ui::Core::Boxes::Card.new(options = nil, html_options = nil).tap do |p|
  #     p.header content = nil, options = nil, html_options = nil, &block
  #     p.block content = nil, options = nil, html_options = nil, &block
  #     p.footer content = nil, options = nil, html_options = nil, &block
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Boxes::Card('test').render
  #
  #   UiBibz::Ui::Core::Boxes::Card(status: :primary) do |d|
  #     'test'
  #   end.render
  #
  #   UiBibz::Ui::Core::Boxes::Card.new().tap do |p|
  #     p.header 'header', glyph: 'eye', class: 'header-test'
  #     p.block do
  #       'body'
  #     end
  #     p.footer 'footer'
  #   end.render
  #
  # ==== Helper
  #
  #   card(content, options = {}, html_options = {})
  #
  #   card(options = {}, html_options = {}) do
  #     content
  #   end
  #
  #   card(options = {}, html_options = {}) do |p|
  #     p.header(content, options = {}, html_options = {})
  #     # or
  #     p.header(options = {}, html_options = {}) do
  #       content
  #     end
  #
  #     p.body(content, options = {}, html_options = {})
  #     # or
  #     p.body(options = {}, html_options = {}) do
  #       content
  #     end
  #
  #     p.footer(content, options = {}, html_options = {})
  #     # or
  #     p.footer(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class Card < UiBibz::Ui::Core::Component
    include CardItemableConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @items = @content.nil? ? [] : [UiBibz::Ui::Core::Boxes::Components::CardBody.new(@content).render]
    end

    # Render html tag
    def pre_render
      content_tag :div, html_structure, html_options
    end

    protected

    def html_structure
      [@header, @items.join, @footer].compact.join.html_safe
    end

    def component_html_classes
      ['card', text, type, tab_pane, outline]
    end

    def status
      return if @options[:status].nil?

      output = @options[:outline] ? ["border-#{@options[:status]}"] : ["bg-#{@options[:status]}"]
      output << 'text-white' if @options[:status] != :light && @options[:status] != :warning
      output.join(' ')
    end

    def text
      "text-#{@options[:text][:size] || :md}-#{@options[:text][:position] || :left}" unless @options[:text].nil?
    end

    def card_block
      'card-block' if !@options[:block].nil? || @tapped
    end

    def type
      "card-#{@options[:type]}" unless @options[:type].nil?
    end

    def tab_pane
      'tab-pane' if @options[:tab]
    end

    def outline
      'bg-transparent' if @options[:outline]
    end
  end
end
