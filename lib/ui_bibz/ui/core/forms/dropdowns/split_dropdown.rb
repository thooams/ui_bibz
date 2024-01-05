# frozen_string_literal: true

module UiBibz::Ui::Core::Forms::Dropdowns
  # Create a button dropdown
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
  # * +status+ - status of element with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:block)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Dropdowns::SplitDropdown.new(options = nil, html_options = nil).tap do |d|
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Dropdowns::SplitDropdown.new(name, status: :success).tap do |d|
  #     d.list link_to('test', '#')
  #     d.list('---')
  #     d.list('Header 1', { type: :header })
  #     d.list link_to('test2', '#')
  #   end.render
  #
  # ==== Helper
  #
  #  split_dropdown(name, options = {}, html_options = {}) do |b|
  #     d.list(content, options = {}, html_options = {})
  #     d.list(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class SplitDropdown < UiBibz::Ui::Core::Forms::Dropdowns::Dropdown
    # See UiBibz::Ui::Core::Forms::Dropdowns::Dropdown.initialize

    # Render html tag
    def pre_render
      content_tag :div, html_options do
        concat button_html
        concat split_html
        concat ul_html
      end
    end

    private

    def component_html_classes
      ['btn-group', position, alignment, open, inline, keep_open]
    end

    def button_html
      content_tag dropdown_tag, button_content, dropdown_html_options
    end

    def split_html
      content_tag :button, split_content, (options[:html_split] || {}).merge(class: split_classes, type: 'button',
                                                                             'data-bs-toggle' => 'dropdown', 'aria-haspopup' => true, 'aria-expanded' => false)
    end

    def split_content
      src_only
    end

    def split_classes
      join_classes('btn', button_status, size, state, 'dropdown-toggle', 'dropdown-toggle-split', options[:split_html].try(:[], :class))
    end

    def src_only
      content_tag :span, 'Toggle Dropdown', class: 'sr-only'
    end

    def dropdown_html_options
      opts = options[:html_button] || {}
      opts = opts.merge(href: options[:url]) if options[:tag] == :a
      opts.merge(class: join_classes('btn', button_status, state, size, options[:html_button].try(:[], :class)))
    end

    def split_dropdown_html_option
      (options[:html_split] || {}).merge({
                                           class: split_classes,
                                           type: 'button',
                                           'data-bs-toggle' => 'dropdown',
                                           'aria-haspopup' => true,
                                           'aria-expanded' => false
                                         })
    end
  end
end
