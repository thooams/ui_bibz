# frozen_string_literal: true

require 'ui_bibz/ui/core/navigations/components/nav_link_link'
require 'ui_bibz/ui/core/navigations/components/nav_link_list'
require 'ui_bibz/ui/core/navigations/components/nav_link_span'
module UiBibz::Ui::Core::Navigations
  # Create a NavLink
  #
  # This element is an extend of UiBibz::Ui::Core::Navigations::Component.
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
  # * +badge+ - String
  # * +link_html_options+ - Hash
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::NavLink.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navigations::NavLink.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::NavLink.new(content, { badge: 15, url: '/', state: :active, link_html_options: { class: 'link1' }},{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Navigations::NavLink.new({glyph: { name: 'eye', size: 3 }, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class NavLink < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern

    # See UiBibz::Ui::Core::Component.initialize
    def initialize(content = nil, options = nil, html_options = nil, &)
      super
      @old_options = options
    end

    # Render html tag
    def pre_render
      if options[:nav_tags] == :a || %w[nav-links list-group].include?(options[:nav_type])
        UiBibz::Ui::Core::Navigations::NavLinkLink.new(content, options, html_options).render
      else
        cont = if options[:tag_type] == :span
                 UiBibz::Ui::Core::Navigations::NavLinkSpan.new(content, @old_options).render
               else
                 UiBibz::Ui::Core::Navigations::NavLinkLink.new(content, options).render
               end
        # html_options[:class] = remove_class(html_options[:class])
        remove_classes
        UiBibz::Ui::Core::Navigations::NavLinkList.new(cont, options, html_options).render
      end
    end

    private

    def remove_classes
      exclude_classes_in_html_options %w[active disabled]
      options.delete(:state)
    end
  end
end
