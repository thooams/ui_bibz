# frozen_string_literal: true

require 'ui_bibz/ui/ux/containers/components/panel_header'
require 'ui_bibz/ui/ux/containers/components/panel_body'
require 'ui_bibz/ui/ux/containers/components/panel_footer'
require 'ui_bibz/ui/ux/containers/components/panel_toolbar'
require 'ui_bibz/ui/ux/containers/components/panel_deck'
require 'ui_bibz/ui/ux/containers/components/panel_group'
require 'ui_bibz/ui/ux/containers/components/panel_column'
module UiBibz::Ui::Ux::Containers
  # Create a Panel
  #
  # This element is an extend of UiBibz::Ui::Core::Boxes::Card
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
  # * +store+ - Store generate by '+table_search_pagination+' method
  #
  # ==== Signatures
  #
  #
  #   UiBibz::Ui::Ux::Containers::Panel.new do |p|
  #     p.header 'header'
  #     p.toolbar do |t|
  #       t.btn_group do |bg|
  #         bg.button 'button'
  #       end
  #     end
  #     p.body 'body'
  #     p.footer 'footer'
  #   end
  #
  class Panel < UiBibz::Ui::Core::Component
    def initialize(content = nil, options = nil, html_options = nil, &block)
      super
      @items = []
    end

    def pre_render
      content_tag :div, html_structure, html_options
    end

    def toolbar(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Ux::Containers::Components::PanelToolbar.new(content, options, html_options).tap(&block).render
    end

    def deck(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Ux::Containers::Components::PanelDeck.new(content, options, html_options).tap(&block).render
    end

    def column(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Ux::Containers::Components::PanelColumn.new(content, options, html_options).tap(&block).render
    end

    def group(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Ux::Containers::Components::PanelGroup.new(content, options, html_options).tap(&block).render
    end

    def panel(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Ux::Containers::Panel.new(content, options, html_options).tap(&block).render
    end

    def body(content = nil, options = nil, html_options = nil, &block)
      @items << UiBibz::Ui::Ux::Containers::Components::PanelBody.new(content, options, html_options, &block).render
    end

    # Add Header which is a component
    def header(content = nil, options = nil, html_options = nil, &block)
      @header = if tapped?(block)
                  UiBibz::Ui::Ux::Containers::Components::PanelHeader.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Ux::Containers::Components::PanelHeader.new(content, options, html_options, &block).render
                end
    end

    # Add Header which is a component
    def footer(content = nil, options = nil, html_options = nil, &block)
      @footer = if tapped?(block)
                  UiBibz::Ui::Ux::Containers::Components::PanelFooter.new(content, options, html_options).tap(&block).render
                else
                  UiBibz::Ui::Ux::Containers::Components::PanelFooter.new(content, options, html_options, &block).render
                end
    end

    private

    def html_structure
      [@header, @items.join, @footer].compact.join.html_safe
    end

    def component_html_classes
      super << 'panel'
    end
  end
end
