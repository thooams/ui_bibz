module UiBibz::Ui
  class Row < Component

    # Create a row
    #
    # ==== Signatures
    #
    #   UiBibz::Ui::Row.new(content, options = {}, html_options = {})
    #
    #   UiBibz::Ui::Row.new(options = {}, html_options = {}) do
    #     #content
    #   end
    #
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    def render
      content_tag :div, @content, class_and_html_options('row')
    end

  end
end
