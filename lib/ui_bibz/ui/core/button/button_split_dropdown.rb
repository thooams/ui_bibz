module UiBibz::Ui::Core

  # Create a button dropdown
  #
  # This element is an extend of UiBibz::Ui::Core::Dropdown.
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
  # * +state+ - State of élement with symbol value:
  #   (+:default+, +:primary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::ButtonSplitDropdown.new(options = nil, html_options = nil).tap do |d|
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::ButtonSplitDropdown.new(name, state: :success).tap do |d|
  #     d.list link_to('test', '#')
  #     d.list('---')
  #     d.list('Header 1', { type: :header })
  #     d.list link_to('test2', '#')
  #   end.render
  #
  # ==== Helper
  #
  #   button_split_dropdown(name, options = {}, html_options = {}) do |b|
  #     d.list(content, options = {}, html_options = {})
  #     d.list(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class ButtonSplitDropdown < Dropdown

    def initialize name, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, class_and_html_options(['btn-group', type]).merge({ role: 'group' }) do
        concat button_html
        concat split_html
        concat ul_html
      end
    end

  private


    def button_html
      content_tag :button, button_content, class: add_classes("btn", button_state, size)
    end

    def split_html
      content_tag :button, split_content, class: add_classes("btn", button_state, "dropdown-toggle"), type: 'button', "data-toggle" => 'dropdown', "aria-expanded" => false
    end

    def split_content
      [caret, src_only].join.html_safe
    end

    def src_only
      content_tag :span, "Toggle Dropdown", class: "sr-only"
    end

    def button_content
      [glyph_with_space, @content].compact.join.html_safe
    end

  end
end
