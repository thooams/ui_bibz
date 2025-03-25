# frozen_string_literal: true

require 'ui_bibz/ui/core/forms/dropdowns/components/dropdown_header'
require 'ui_bibz/ui/core/forms/dropdowns/components/dropdown_divider'
require 'ui_bibz/ui/core/forms/dropdowns/components/dropdown_link'
require 'ui_bibz/ui/core/forms/dropdowns/components/dropdown_dropdown'
module UiBibz::Ui::Core::Forms::Dropdowns
  # Create a dropdown
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
  # * +size+
  # * +open+ - Boolean
  #   (+:xs+, +:sm+, +:lg+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  # * +html_button+ - Hash
  # * +theme+ - Symbol, defaut: +:dark+
  # * +position+ - Symbol
  #   (+:up+, +:right+, +:down+, +:left+)
  # * +alignment+ - Symbol/Hash - eq. { direction: :start, size: :lg }
  #   (+:left+, +:right+, +:start+, +:end+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new(options = nil, html_options = nil).tap do |d|
  #     ...
  #     d.header content = nil, options = nil, html_options = nil, &block
  #     d.divider
  #     d.link content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.new(name, status: :success).tap do |d|
  #     d.link 'test', { url: '#' }
  #     d.divider
  #     d.header 'Header 1'
  #     d.link 'test2', { url: '#' }
  #   end.render
  #
  # ==== Helper
  #
  #   dropdown(name, options = {}, html_options = {}) do |d|
  #     d.link(content, options = {}, html_options = {})
  #     d.link(options = {}, html_options = {}) do
  #       content
  #     end
  #     d.divider
  #     d.header(content, options = {}, html_options = {})
  #     d.header(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class Dropdown < UiBibz::Ui::Core::Component
    include UiBibz::Ui::Concerns::HtmlConcern

    def initialize(...)
      super
      @items = []
      @status = @options.delete(:status)
    end

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat button_html
        concat ul_html
      end
    end

    # Add dropdown header
    # See UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownHeader
    def header(content = nil, options = nil, html_options = nil, &)
      @items << UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownHeader.new(content, options, html_options, &).render
    end

    # Add dropdown Separator
    # See UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownDivider
    def divider
      @items << UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownDivider.new.render
    end

    # Add dropdown link in list
    # See UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownLink
    def link(content = nil, options = nil, html_options = nil, &)
      @items << UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownLink.new(content, options, html_options, &).render
    end

    def dropdown(name = nil, options = nil, html_options = nil, &)
      @items << UiBibz::Ui::Core::Forms::Dropdowns::Components::DropdownDropdown.new(name, options, html_options).tap(&).render
    end

    def id
      @id ||= html_options[:id] || generate_id('dropdown')
    end

    protected

    def component_html_classes
      [position, open, inline, without_caret, keep_open]
    end

    def button_content
      glyph_and_content_html(@content)
    end

    def button_html
      html_button = options[:html_button] || {}
      if options[:tag] == :a
        content_tag dropdown_tag, button_content, { class: join_classes('btn', button_status, state, size, 'dropdown-toggle', html_button.delete(:class)), role: 'button', 'data-bs-toggle' => 'dropdown', 'aria-expanded' => false, 'id' => id }.merge(html_button)
      else
        content_tag dropdown_tag, button_content, { class: join_classes('btn', button_status, state, size, 'dropdown-toggle', html_button.delete(:class)), type: 'button', 'data-bs-toggle' => 'dropdown', 'aria-expanded' => false, 'id' => id }.merge(html_button)
      end
    end

    def ul_html
      content_tag :div, @items.join.html_safe, class: join_classes('dropdown-menu', theme, alignment, open), 'arial-labelledby' => id
    end

    def dropdown_tag
      options[:tag] || :button
    end

    def alignment
      return nil if @options[:alignment].nil?

      if @options[:alignment].is_a? Hash
        ['dropdown-menu', @options[:alignment][:size], match_direction[@options[:alignment][:direction]]].join('-')
      else
        "dropdown-menu-#{match_direction[@options[:alignment]]}"
      end
    end

    def position
      "drop#{match_direction[@options[:position] || :down]}"
    end

    def open
      'show' if @options[:open]
    end

    def keep_open
      'keep-open' if @options[:keep_open]
    end

    def inline
      'btn-group' if @options[:inline] || @options[:alignment]
    end

    def without_caret
      'without-caret' if @options[:caret] == false
    end

    def outline
      'outline' if @options[:outline]
    end

    def button_status
      ['btn', outline, @status || :secondary].compact.join('-')
    end

    # :lg, :sm or :xs
    def size
      "btn-#{@options[:size]}" if @options[:size]
    end

    def theme
      'dropdown-menu-dark' if @options[:theme]
    end

    # Match end and start directions
    def match_direction
      {
        up: 'up',
        right: 'end',
        down: 'down',
        left: 'start',
        start: 'start',
        end: 'end'
      }.with_indifferent_access
    end
  end
end
