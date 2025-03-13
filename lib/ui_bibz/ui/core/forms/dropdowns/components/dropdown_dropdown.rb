# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Dropdowns::Components
  # Create DropdownDropdown
  #
  # This element is an extend of UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.
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
  # * +link_html_options+ - Hash
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::DropdownDropdown.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Forms::DropdownDropdown.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::DropdownDropdown.new('Home', { glyph: 'home', state: :active, url: '#home', link_html_options: { class: 'link1' }},{ class: 'test' }).render
  #
  #   UiBibz::Ui::Core::Forms::DropdownDropdown.new({ glyph: { name: 'eye', size: 3 }, url: '#home' }, { class: 'test' }) do
  #     'Home'
  #   end.render
  #
  class DropdownDropdown < UiBibz::Ui::Core::Component
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

    def dropdown(content = nil, options = nil, html_options = nil, &)
      @items << new(content, options, html_options, &).render
    end

    def id
      @id ||= html_options[:id] || generate_id('dropdown')
    end

    protected

    def component_html_classes
      ['dropdown-item', hover, position, open, inline, without_caret, keep_open]
    end

    def button_content
      glyph_and_content_html(@content)
    end

    def button_html
      content_tag :a, button_content, { class: join_classes(state, 'dropdown-toggle'), role: 'button', 'data-bs-toggle' => 'dropdown', 'aria-expanded' => false, 'id' => id }
    end

    def ul_html
      content_tag :div, @items.join.html_safe, class: join_classes('dropdown-menu', theme, alignment, open), 'arial-labelledby' => id
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
      "drop#{match_direction[@options[:position] || :right]}"
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

    def hover
      'dropdown-hover' if @options[:hover]
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
