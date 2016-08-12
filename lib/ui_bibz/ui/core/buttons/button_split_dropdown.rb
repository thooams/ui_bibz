module UiBibz::Ui::Core::Buttons

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
  # * +status+ - status of élement with symbol value:
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
  #   UiBibz::Ui::Core::Buttons::ButtonSplitDropdown.new(options = nil, html_options = nil).tap do |d|
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Buttons::ButtonSplitDropdown.new(name, status: :success).tap do |d|
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
  class ButtonSplitDropdown < UiBibz::Ui::Core::Dropdown

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize name, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, html_options do
        concat button_html
        concat split_html
        concat ul_html
      end
    end

  private

    def component_html_classes
      ['btn-group', type]
    end

    def component_html_options
      { role: 'group' }
    end

    def button_html
      content_tag :button, button_content, class: join_classes("btn", button_status, size)
    end

    def split_html
      content_tag :button, split_content, class: join_classes("btn", button_status, size, "dropdown-toggle", "dropdown-toggle-split"), type: 'button', "data-toggle" => 'dropdown', "aria-haspopup" => true, "aria-expanded" => false
    end

    def split_content
      src_only
    end

    def src_only
      content_tag :span, "Toggle Dropdown", class: "sr-only"
    end

    def button_content
      [glyph_with_space, content].compact.join.html_safe
    end

  end
end
