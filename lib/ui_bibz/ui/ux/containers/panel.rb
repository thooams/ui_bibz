require 'ui_bibz/ui/ux/containers/components/panel_header'
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
  class Panel < UiBibz::Ui::Core::Boxes::Card

    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def toolbar content = nil, options = nil, html_options = nil, &block
      @items << content_tag(:div, class: 'panel-toolbar') do
        UiBibz::Ui::Core::Navigations::Toolbar.new(content, options, html_options).tap(&block).render
      end
    end

    # Add Header which is a component
    def header content = nil, options = nil, html_options = nil, &block
      options, content = inherit_options(content, options, block)
      if is_tap(content, options)
        @header = UiBibz::Ui::Ux::Containers::Components::PanelHeader.new(content, options, html_options).tap(&block).render
      else
        @header = UiBibz::Ui::Ux::Containers::Components::PanelHeader.new(content, options, html_options, &block).render
      end
    end

    private

    def component_html_classes
      super << 'panel'
    end

  end
end
